"
Description
--------------------

Abstract superclass of all Seaside components of Miniatures Gallery. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #MGComponent,
	#superclass : #WAComponent,
	#category : #'MiniaturesGallery-Core'
}

{ #category : #convenience }
MGComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
MGComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
MGComponent >> rootComponent [
	^ self session rootComponent
]
