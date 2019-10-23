"
Description
--------------------

TODO
"
Class {
	#name : #BBGWelcomePage,
	#superclass : #BBGPage,
	#category : #'BloodBowlGallery-Pages'
}

{ #category : #accessing }
BBGWelcomePage class >> pageName [
	^ 'Welcome'
]

{ #category : #accessing }
BBGWelcomePage class >> priority [
	^ 1
]

{ #category : #accessing }
BBGWelcomePage >> pageTitle [
	^ 'Blood Bowl Teams'
]

{ #category : #rendering }
BBGWelcomePage >> renderPageContentOn: html [
	html div
		style: 'display: flex;flex-wrap: wrap; justify-content: space-around; align-items: center;';
		with: [ (BBGTeamPage pages sorted: #priority ascending)
				do: [ :page | 
					html div
						class: 'gallery';
						style: 'max-width: 30%';
						shadow: 8;
						with: [ html anchor
								callback: [ self displayInstanceOf: page ];
								with: [ html image url: (page urlOfMainPlayer) ].
							html div
								class: 'desc';
								with: page pageName ] ] ]
]
