Class {
	#name : #BBGBridge,
	#superclass : #GitBridge,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGBridge class >> resources [
	^ self root / 'resources'
]
