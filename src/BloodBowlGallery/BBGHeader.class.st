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
						callback: [ self displayInstanceOf: BBGWelcomePage ];
						with: [ html
								mdlLayoutTitle: 'Cyril Ferlicot''s Blood Bowl Gallery' ].
					html mdlLayoutSpacer ] ].
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
