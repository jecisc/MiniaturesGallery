"
Description
--------------------

Simple session for the Miniatures Gallery. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #MGSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent'
	],
	#category : #'MiniaturesGallery-Core'
}

{ #category : #accessing }
MGSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
MGSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
