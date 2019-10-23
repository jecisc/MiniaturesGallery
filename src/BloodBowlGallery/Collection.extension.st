Extension { #name : #Collection }

{ #category : #'*BloodBowlGallery' }
Collection >> sortFilesByIndexes [
	^ self sorted: [ :file | file index - ((file basenameWithoutExtension endsWith: 'back') ifTrue: [ 0 ] ifFalse: [ 0.5 ]) ] ascending
]
