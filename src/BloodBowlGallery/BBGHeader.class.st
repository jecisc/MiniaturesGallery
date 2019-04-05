"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #BBGHeader,
	#superclass : #BBGComponent,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGHeader >> possiblePages [
	^ BBGPage pagesToDisplay
]

{ #category : #rendering }
BBGHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ 
			html
				mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: 'Cyril Ferlicot''s Blood Bowl Gallery.' ].
					html mdlLayoutSpacer.
					html text: 'Version 0.0.0'. ] ].
	self renderDrawerOn: html
]

{ #category : #rendering }
BBGHeader >> renderDrawerOn: html [
	html
		mdlLayoutDrawer: [ 
			html
				mdlNavigation: [ 
					self possiblePages
						do: [ :aClass | 
							html mdlNavigationLink
								beCurrentIf: aClass = self rootComponent componentToDisplay class;
								callback: [ self displayInstanceOf: aClass ];
								with: aClass pageName ] ] ]
]
