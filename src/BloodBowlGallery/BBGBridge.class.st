Class {
	#name : #BBGBridge,
	#superclass : #GitBridge,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGBridge class >> resources [
	^ self root / 'resources'
]

{ #category : #assessing }
BBGBridge class >> root [
	^ [ super root ]
		on: GBRepositoryWithoutLocalRepository
		do: [ :exception | 
			FileLocator imageDirectory directories
				detect: [ :dir | dir basename = self package name ]
				ifFound: [ :dir | 
					self icebergRepository location: dir.
					super root ]
				ifNone: [ exception pass ] ]
]
