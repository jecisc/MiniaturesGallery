"
Description
--------------------

Simple session for the Blood Bowl Gallery. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #BBGSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent'
	],
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
BBGSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
