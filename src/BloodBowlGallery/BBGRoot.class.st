"
Description
--------------------

I am the root component of Blood Bowl Gallery. I will contain every components of the application to display.

I have a header and a footer.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	componentInstances:			<aDictionary>	A dictionary keeping for each component class, an instance. This instance can be use when the user change of page to come pack to a previous page.
	componentToDisplay:		<aComponent>	The current page to display as the root content.
	footer:						<aComponent>	The footer of the page.
	header:						<aComponent>	The header of the page.

"
Class {
	#name : #BBGRoot,
	#superclass : #BBGComponent,
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'footer'
	],
	#classVars : [
		'IsDevelopment'
	],
	#category : #'BloodBowlGallery-Core'
}

{ #category : #'instance creation' }
BBGRoot class >> applicationName [
	^ 'bloodbowl'
]

{ #category : #testing }
BBGRoot class >> beDevelopment [
	self isDevelopment: true.
	(ZnServer defaultOn: 1706)
		logToTranscript;
		delegate:
			(ZnStaticFileServerDelegate new
				prefixFromString: 'resources';
				directory: StartupPreferencesLoader preferencesGeneralFolder / 'GitRepositories' / 'jecisc' / 'BloodBowlGallery' / 'resources';
				yourself);
		start
]

{ #category : #testing }
BBGRoot class >> canBeRoot [
	^ true
]

{ #category : #initialization }
BBGRoot class >> initialize [
	self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ].	"Remove development tools."
	^ (WAAdmin register: self asApplicationAt: self applicationName)
		preferenceAt: #sessionClass put: BBGSession;
		preferenceAt: #trackingStrategy put: WACookieForBrowserIPForCrawlerTrackingStrategy new;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: BBGLibrary;
		yourself
]

{ #category : #testing }
BBGRoot class >> isDevelopment [
	^ IsDevelopment ifNil: [ IsDevelopment := false ]
]

{ #category : #testing }
BBGRoot class >> isDevelopment: aBoolean [
	IsDevelopment := aBoolean
]

{ #category : #'world menu' }
BBGRoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Blood Bowl Gallery')
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ].
			(aBuilder item: #'Be develpment')
				order: 3;
				iconName: #configuration;
				action: [ self beDevelopment ].
			(aBuilder item: #'Import example')
				order: 4;
				iconName: #smallHelp;
				action: [ GTPlayground
						openContents:
							'"The images need to be in the image directory"

BBGKhemriPage
	extension: ''JPG''
	team: #(''1418'' ''1419'' ''1420'') 
	groups: { ''Tomb Guardians'' -> ''1415'' . ''Blitz-ras and Throw-ras'' -> ''1416'' . ''Skeletons'' -> ''1417'' } asOrderedDictionary
	players: (((1369 to: 1380) pairsCollect: [ :a :b | a asString -> b asString ]) , ((1395 to: 1414) pairsCollect: [ :a :b | a asString -> b asString ])) asOrderedDictionary' ] ]
]

{ #category : #'instance creation' }
BBGRoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/', self applicationName
]

{ #category : #accessing }
BBGRoot class >> resourcesRoot [
	^ (self isDevelopment ifTrue: [ '//localhost:1706/' ] ifFalse: [ '/' ]) , 'resources/'
]

{ #category : #hooks }
BBGRoot >> children [
	^ { self header. self componentToDisplay. self footer }
]

{ #category : #accessing }
BBGRoot >> componentInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ componentInstances
]

{ #category : #accessing }
BBGRoot >> componentInstances: aDictionary [
	componentInstances := aDictionary
]

{ #category : #accessing }
BBGRoot >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
BBGRoot >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
BBGRoot >> defaultFooter [
	^ BBGFooter new
]

{ #category : #components }
BBGRoot >> defaultHeader [
	^ BBGHeader new
]

{ #category : #updating }
BBGRoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
BBGRoot >> footer [
	^ footer
]

{ #category : #accessing }
BBGRoot >> footer: aComponent [
	footer := aComponent
]

{ #category : #accessing }
BBGRoot >> header [
	^ header
]

{ #category : #accessing }
BBGRoot >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
BBGRoot >> initialRequest: aRequest [
	| consumer pageName |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.
	
	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"
	
	"Try to find a page corresponding"
	self header possiblePages
		detect: [ :each | each pathName asLowercase = pageName ]
		ifFound: [ :class | 
			self displayInstanceOf: class.

			"If we find a page, we pop the subpart of the path corresponding to the page."
			consumer next ]
]

{ #category : #initialization }
BBGRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: self header possiblePages first
]

{ #category : #rendering }
BBGRoot >> renderContentOn: html [
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'blood-bowl-gallery';
								size: 12;
								with: [ html render: self componentToDisplay ] ].
					html render: self footer ] ].
	"To make a low res background load first"
	html image
		style: 'display: none';
		url: self class resourcesRoot , 'wallpaper.jpg';
		id: 'wallpaper'.

	html document
		addLoadScript:
			('$("#wallpaper").on("load", function() {
    $("main").css({
        "background-image" : "url(' , (self class resourcesRoot , 'wallpaper.jpg')
				,
					')"
    });
	this.remove();
}).each(function() {
  if(this.complete) {
       // In case the cached image is loaded before the handler is added.
       $(this).trigger("load"); // For jQuery >= 3.0 
  }
});;') js
]

{ #category : #updating }
BBGRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Cyril Ferlicot''s Blood Bowl Gallery'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'
]

{ #category : #updating }
BBGRoot >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
