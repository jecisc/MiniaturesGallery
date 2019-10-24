Class {
	#name : #BaselineOfMiniaturesGallery,
	#superclass : #BaselineOf,
	#category : #BaselineOfMiniaturesGallery
}

{ #category : #baselines }
BaselineOfMiniaturesGallery >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self
				gitBridge: spec;
				materialDesignLite: spec.

			"Packages"
			spec package: 'MiniaturesGallery' with: [ spec requires: #('MaterialDesignLite' 'GitBridge') ] ]
]

{ #category : #dependencies }
BaselineOfMiniaturesGallery >> gitBridge: spec [
	spec
    	baseline: 'GitBridge'
    	with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMiniaturesGallery >> materialDesignLite: spec [
	spec
		baseline: 'MaterialDesignLite'
		with: [ spec
				loads: 'core';
				repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #accessing }
BaselineOfMiniaturesGallery >> projectClass [
	^ MetacelloCypressBaselineProject
]
