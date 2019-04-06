"
Description
--------------------

A footer for the application with all the useful links.
"
Class {
	#name : #BBGFooter,
	#superclass : #BBGComponent,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGFooter >> links [
	^ OrderedDictionary with: 'Personnal website' -> 'https://ferlicot.fr' with: 'Powered by Seaside' -> 'https://github.com/SeasideSt/Seaside'
]

{ #category : #rendering }
BBGFooter >> renderContentOn: html [
	html mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'Blood Bowl Gallery'.
					html
						mdlMiniFooterLinkList: [ self links
								keysAndValuesDo: [ :label :url | 
									html
										listItem: [ html anchor
												url: url;
												with: label ] ] ] ].
			html mdlMiniFooterRightSection: [ html mdlMiniFooterLinkList: [ html listItem: [ html text: 'Cyril Ferlicot-Delbecque' ] ] ] ]
]
