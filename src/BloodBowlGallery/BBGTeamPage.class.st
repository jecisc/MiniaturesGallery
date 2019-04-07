Class {
	#name : #BBGTeamPage,
	#superclass : #BBGPage,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #import }
BBGTeamPage class >> extension: extension team: aCollection groups: aCollection3 players: aCollection4 [
	| count |
	self
		compile:
			('teamImages
	^ OrderedDictionary
		with: ''Full team'' -> ''{1}''
		with: ''Full team from top'' -> ''{2}''
		with: ''Full team from back'' -> ''{3}''' format: (aCollection collect: [ :each | self urlFor: each extension: extension ]))
		classified: 'accessing'.
	self
		compile:
			(String
				streamContents: [ :s | 
					s
						<<
							'teamGroups
	^ OrderedDictionary
		'.
					aCollection3
						keysAndValuesDo: [ :grp :img | 
							s
								nextPutAll: 'with: ''';
								nextPutAll: grp;
								nextPutAll: ''' -> ''';
								nextPutAll: (self urlFor: img extension: extension);
								nextPut: $';
								cr;
								tab;
								tab ] ])
		classified: 'accessing'.
	count := 1.
	self
		compile:
			(String
				streamContents: [ :s | 
					s
						<<
							'teamPlayers
	^ OrderedDictionary new
		'.
					aCollection4
						keysAndValuesDo: [ :img1 :img2 | 
							s
								nextPutAll: 'at: ''Player ';
								print: count;
								nextPutAll: ''' put: (''';
								nextPutAll: (self urlFor: img1 extension: extension);
								nextPutAll: ''' -> ''';
								nextPutAll: (self urlFor: img2 extension: extension);
								nextPutAll: ''');';
								cr;
								tab;
								tab.
							count := count + 1 ].
					s << 'yourself' ])
		classified: 'accessing'
]

{ #category : #testing }
BBGTeamPage class >> isAbstract [
	^ self = BBGTeamPage
]

{ #category : #import }
BBGTeamPage class >> urlFor: each extension: extension [
	^ 'IMG_' , each , '.' , extension
]

{ #category : #accessing }
BBGTeamPage >> pageTitle [
	^ self class pageName
]

{ #category : #rendering }
BBGTeamPage >> renderGalleryTitled: aString img: anImage back: anotherImg on: html [
	html div
		class: 'gallery gallery2';
		shadow: 6;
		with: [ html anchor
				url: (self urlOf: anImage);
				with: [ html image url: (self urlOf: anImage) ].
			html anchor
				url: (self urlOf: anotherImg);
				with: [ html image url: (self urlOf: anotherImg) ].
			html div
				class: 'desc';
				with: aString ]
]

{ #category : #rendering }
BBGTeamPage >> renderGalleryTitled: aString img: anImage on: html [
	html div
		class: 'gallery';
		shadow: 6;
		with: [ html anchor
				url: (self urlOf: anImage);
				with: [ html image url: (self urlOf: anImage) ].
			html div
				class: 'desc';
				with: aString ]
]

{ #category : #rendering }
BBGTeamPage >> renderPageContentOn: html [
	html heading
		level2;
		mdlTypographySubhead;
		with: 'Team'.
	html div
		style: 'display: flex;flex-wrap: wrap;justify-content: space-around; align-items: center;';
		with: [ self teamImages keysAndValuesDo: [ :title :img | self renderGalleryTitled: title img: img on: html ] ].
	html heading
		level2;
		mdlTypographySubhead;
		with: 'Positions'.
	html div
		style: 'display: flex;flex-wrap: wrap;justify-content: space-around; align-items: center;';
		with: [ self teamGroups keysAndValuesDo: [ :title :img | self renderGalleryTitled: title img: img on: html ] ].
	html heading
		level2;
		mdlTypographySubhead;
		with: 'Players'.
	html div
		style: 'display: flex;flex-wrap: wrap;justify-content: space-around; align-items: center;';
		with: [ self teamPlayers
				keysAndValuesDo: [ :title :imgs | 
					self
						renderGalleryTitled: title
						img: imgs key
						back: imgs value
						on: html ] ]
]

{ #category : #accessing }
BBGTeamPage >> teamGroups [
	^ self subclassResponsibility
]

{ #category : #accessing }
BBGTeamPage >> teamImages [
	^ self subclassResponsibility
]

{ #category : #accessing }
BBGTeamPage >> teamPlayers [
	^ self subclassResponsibility
]

{ #category : #accessing }
BBGTeamPage >> urlOf: anImage [
	^ (BBGRoot isDevelopment ifTrue: [ '//localhost:1706/' ] ifFalse: [ '/' ]) , 'resources/' , self pageTitle asLowercase , '/' , anImage
]
