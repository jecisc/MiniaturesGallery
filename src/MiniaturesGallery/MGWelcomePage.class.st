"
Description
--------------------

TODO
"
Class {
	#name : #MGWelcomePage,
	#superclass : #MGPage,
	#category : #'MiniaturesGallery-Pages'
}

{ #category : #accessing }
MGWelcomePage class >> pageName [
	^ 'Welcome'
]

{ #category : #accessing }
MGWelcomePage class >> priority [
	^ 1
]

{ #category : #accessing }
MGWelcomePage >> pageTitle [
	^ 'Miniatures'
]

{ #category : #rendering }
MGWelcomePage >> renderPageContentOn: html [
	MGTeamPage games
		do: [ :gameFolder | 
			html heading
				level2;
				mdlTypographyTitle;
				with: gameFolder bbgDisplayName.

			html div
				style: 'display: flex;flex-wrap: wrap; justify-content: space-around; align-items: center;';
				with: [ (MGTeamPage pages select: [ :each | each teamFolder parent asAbsolute canonicalize = gameFolder asAbsolute canonicalize ])
						do: [ :page | 
							html div
								class: 'gallery';
								style: 'max-width: 30%';
								shadow: 8;
								with: [ html anchor
										callback: [ self displayInstanceOf: page ];
										with: [ html image url: page urlOfMainPlayer ].
									html div
										class: 'desc';
										with: page pageName ] ] ] ]
		separatedBy: [ html tag: 'hr' ]
]
