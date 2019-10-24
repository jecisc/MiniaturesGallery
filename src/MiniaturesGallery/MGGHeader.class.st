"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #MGGHeader,
	#superclass : #MGComponent,
	#category : #'MiniaturesGallery-Core'
}

{ #category : #accessing }
MGGHeader >> possiblePages [
	^ MGPage pagesToDisplay
]

{ #category : #rendering }
MGGHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ 
			html
				mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ self displayInstanceOf: MGWelcomePage ];
						with: [ html
								mdlLayoutTitle: 'Miniatures Gallery' ].
					html mdlLayoutSpacer ] ].
	self renderDrawerOn: html
]

{ #category : #rendering }
MGGHeader >> renderDrawerOn: html [
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
