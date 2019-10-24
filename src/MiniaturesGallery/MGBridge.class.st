Class {
	#name : #MGBridge,
	#superclass : #GitBridge,
	#category : #'MiniaturesGallery-Core'
}

{ #category : #accessing }
MGBridge class >> resources [
	^ self root / 'resources'
]

{ #category : #assessing }
MGBridge class >> root [
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
