"
Description
--------------------

TODO
"
Class {
	#name : #BBGWelcomePage,
	#superclass : #BBGPage,
	#category : #'BloodBowlGallery-Pages'
}

{ #category : #accessing }
BBGWelcomePage class >> pageName [
	^ 'Welcome'
]

{ #category : #accessing }
BBGWelcomePage class >> priority [
	^ 1
]

{ #category : #accessing }
BBGWelcomePage >> pageTitle [
	^ 'Blood bowl teams'
]

{ #category : #rendering }
BBGWelcomePage >> renderPageContentOn: html [
	html
		unorderedList: [ (BBGTeamPage allSubclasses sorted: #priority ascending)
				do: [ :class | 
					html
						listItem: [ html anchor
								callback: [ self displayInstanceOf: class ];
								with: class pageName, ' team' ] ] ]
]
