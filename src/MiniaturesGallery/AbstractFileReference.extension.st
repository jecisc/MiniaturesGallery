Extension { #name : #AbstractFileReference }

{ #category : #'*MiniaturesGallery' }
AbstractFileReference >> bbgDisplayName [
	^ (self basenameWithoutExtension copyWithRegex: '^[0-9]+_*' matchesReplacedWith: '') copyReplaceAll: '-' with: ' '
]

{ #category : #'*MiniaturesGallery' }
AbstractFileReference >> index [
	^ (self basename copyUpTo: $_) asNumber
]
