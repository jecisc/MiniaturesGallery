Extension { #name : #AbstractFileReference }

{ #category : #'*BloodBowlGallery' }
AbstractFileReference >> bbgDisplayName [
	^ (self basenameWithoutExtension copyWithRegex: '^[0-9]+_*' matchesReplacedWith: '') copyReplaceAll: '-' with: ' '
]

{ #category : #'*BloodBowlGallery' }
AbstractFileReference >> index [
	^ (self basename copyUpTo: $_) asNumber
]
