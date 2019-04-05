"
Description
--------------------

Abstract superclass of all Seaside components of Blood Bowl Gallery. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #BBGComponent,
	#superclass : #WAComponent,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #convenience }
BBGComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
BBGComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
BBGComponent >> rootComponent [
	^ self session rootComponent
]
