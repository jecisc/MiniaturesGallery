Class {
	#name : #BaselineOfBloodBowlGallery,
	#superclass : #BaselineOf,
	#category : #BaselineOfBloodBowlGallery
}

{ #category : #baselines }
BaselineOfBloodBowlGallery >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self
				gitBridge: spec;
				materialDesignLite: spec.

			"Packages"
			spec package: 'BloodBowlGallery' with: [ spec requires: #('MaterialDesignLite' 'GitBridge') ] ]
]

{ #category : #dependencies }
BaselineOfBloodBowlGallery >> gitBridge: spec [
	spec
    	baseline: 'GitBridge'
    	with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfBloodBowlGallery >> materialDesignLite: spec [
	spec
		baseline: 'MaterialDesignLite'
		with: [ spec
				loads: 'core';
				repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #accessing }
BaselineOfBloodBowlGallery >> projectClass [
	^ MetacelloCypressBaselineProject
]
