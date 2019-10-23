Class {
	#name : #BBGTeamPage,
	#superclass : #BBGPage,
	#instVars : [
		'teamFolder'
	],
	#category : #'BloodBowlGallery-Core'
}

{ #category : #testing }
BBGTeamPage class >> isAbstract [
	^ self = BBGTeamPage
]

{ #category : #accessing }
BBGTeamPage class >> pages [
	^ self teams collect: [ :team | self teamFolder: team ]
]

{ #category : #'instance creation' }
BBGTeamPage class >> teamFolder: aString [
	^ self new
		teamFolder: aString;
		yourself
]

{ #category : #accessing }
BBGTeamPage class >> teams [
	^ BBGBridge resources directories sortFilesByIndexes
]

{ #category : #accessing }
BBGTeamPage >> pageName [
	^ self teamFolder bbgDisplayName
]

{ #category : #accessing }
BBGTeamPage >> priority [
	^ self teamFolder index + 1
]

{ #category : #rendering }
BBGTeamPage >> renderGalleryFor: aCollectionOfImages inFolderNamed: aString on: html [
	html div
		class: 'gallery';
		class: 'gallery2' if: aCollectionOfImages size > 1;
		shadow: 6;
		with: [ aCollectionOfImages
				do: [ :img | 
					| url |
					url := self urlOf: aString , '/' , img basename.
					html anchor
						url: url;
						with: [ html image url: url ] ].
			html div
				class: 'desc';
				with: aCollectionOfImages first bbgDisplayName ]
]

{ #category : #rendering }
BBGTeamPage >> renderPageContentOn: html [
	self teamFolder directories sortFilesByIndexes do: [ :folder | self renderSectionFor: folder on: html ]
]

{ #category : #rendering }
BBGTeamPage >> renderSectionFor: aFolder on: html [
	html heading
		level2;
		mdlTypographySubhead;
		with: aFolder bbgDisplayName.
	html div
		style: 'display: flex;flex-wrap: wrap;justify-content: space-around; align-items: center;';
		with: [ (aFolder files sortFilesByIndexes groupedBy: [ :e | e basename copyUpTo: $_ ])
				valuesDo: [ :coll | self renderGalleryFor: coll inFolderNamed: aFolder basename on: html ] ]
]

{ #category : #accessing }
BBGTeamPage >> teamFolder [
	^ teamFolder
]

{ #category : #accessing }
BBGTeamPage >> teamFolder: anObject [
	teamFolder := anObject
]

{ #category : #accessing }
BBGTeamPage >> urlOf: anImage [
	^ BBGRoot resourcesRoot , self teamFolder basename asLowercase , '/' , anImage
]

{ #category : #accessing }
BBGTeamPage >> urlOfMainPlayer [
	| playersFolder |
	playersFolder := self teamFolder directories detect: [ :dir | dir basename asLowercase includesSubstring: 'player' ].
	^ self urlOf: playersFolder basename , '/' , playersFolder files sortFilesByIndexes first basename
]
