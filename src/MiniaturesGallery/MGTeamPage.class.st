Class {
	#name : #MGTeamPage,
	#superclass : #MGPage,
	#instVars : [
		'teamFolder'
	],
	#category : #'MiniaturesGallery-Core'
}

{ #category : #accessing }
MGTeamPage class >> games [
	^ MGBridge resources directories sortFilesByIndexes
]

{ #category : #testing }
MGTeamPage class >> isAbstract [
	^ self = MGTeamPage
]

{ #category : #accessing }
MGTeamPage class >> pages [
	^ self teams collect: [ :team | self teamFolder: team ]
]

{ #category : #'instance creation' }
MGTeamPage class >> teamFolder: aString [
	^ self new
		teamFolder: aString;
		yourself
]

{ #category : #accessing }
MGTeamPage class >> teams [
	^ self games flatCollect: [ :folder | folder directories sortFilesByIndexes ]
]

{ #category : #accessing }
MGTeamPage >> pageName [
	^ self teamFolder bbgDisplayName
]

{ #category : #printing }
MGTeamPage >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $[;
		nextPutAll: self teamFolder bbgDisplayName;
		nextPut: $]
]

{ #category : #accessing }
MGTeamPage >> priority [
	^ self teamFolder parent index * 500 + self teamFolder index + 1
]

{ #category : #rendering }
MGTeamPage >> renderGalleryFor: aCollectionOfImages inFolderNamed: aString on: html [
	html div
		class: 'gallery';
		class: 'gallery2' if: aCollectionOfImages size > 1;
		shadow: 6;
		with: [ aCollectionOfImages
				do: [ :img | 
					| url |
					url := self urlOf: img.
					html anchor
						url: url;
						with: [ html image url: url ] ].
			html div
				class: 'desc';
				with: aCollectionOfImages first bbgDisplayName ]
]

{ #category : #rendering }
MGTeamPage >> renderPageContentOn: html [
	self teamFolder directories sortFilesByIndexes do: [ :folder | self renderSectionFor: folder on: html ]
]

{ #category : #rendering }
MGTeamPage >> renderSectionFor: aFolder on: html [
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
MGTeamPage >> teamFolder [
	^ teamFolder
]

{ #category : #accessing }
MGTeamPage >> teamFolder: anObject [
	teamFolder := anObject
]

{ #category : #accessing }
MGTeamPage >> urlOf: anImage [
	^ BBGRoot resourcesRoot , (anImage relativeTo: MGBridge resources) pathString
]

{ #category : #accessing }
MGTeamPage >> urlOfMainPlayer [
	| playersFolder |
	playersFolder := self teamFolder directories detect: [ :dir | dir basename asLowercase includesSubstring: 'player' ] ifNone: [ ^ '.' asFileReference ].
	^ self urlOf: playersFolder files sortFilesByIndexes first
]
