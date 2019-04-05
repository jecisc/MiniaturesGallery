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
	^ 'Hello world'
]

{ #category : #accessing }
BBGWelcomePage class >> priority [
	^ 1
]

{ #category : #rendering }
BBGWelcomePage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
