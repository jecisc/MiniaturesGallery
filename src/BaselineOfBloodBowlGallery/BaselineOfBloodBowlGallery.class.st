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
			self materialDesignLite: spec.

			"Packages"
			spec package: 'BloodBowlGallery' with: [ spec requires: #('MaterialDesignLite') ] ]
]

{ #category : #dependencies }
BaselineOfBloodBowlGallery >> materialDesignLite: spec [
	spec baseline: 'MaterialDesignLite' with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #accessing }
BaselineOfBloodBowlGallery >> projectClass [
	^ MetacelloCypressBaselineProject
]
