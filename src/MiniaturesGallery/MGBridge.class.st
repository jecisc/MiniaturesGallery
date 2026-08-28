Class {
	#name : 'MGBridge',
	#superclass : 'GitBridge',
	#category : 'MiniaturesGallery-Core',
	#package : 'MiniaturesGallery',
	#tag : 'Core'
}

{ #category : 'class initialization' }
MGBridge class >> initialize [

	SessionManager default registerUserClassNamed: self name.
	self startUp: true
]

{ #category : 'accessing' }
MGBridge class >> resources [
	^ self root / 'resources'
]

{ #category : 'assessing' }
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

{ #category : 'class initialization' }
MGBridge class >> startUp: isImageStarting [

	isImageStarting ifTrue: [
			IceRepository registry
				detect: [ :repository | repository name = #MiniaturesGallery ]
				ifFound: [ :repository | repository isMissing ifTrue: [ FileLocator imageDirectory asFileReference / 'MiniatureGallery' ] ] ]
]
