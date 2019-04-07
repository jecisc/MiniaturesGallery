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
	^ 'Blood bowl teams'
]

{ #category : #rendering }
BBGWelcomePage >> renderPageContentOn: html [
	html div
		style: 'display: flex;flex-wrap: wrap; justify-content: space-around; align-items: center;';
		with: [ (BBGTeamPage allSubclasses sorted: #priority ascending)
				do: [ :class | 
					html div
						class: 'gallery';
						style: 'max-width: 30%';
						shadow: 8;
						with: [ html anchor
								callback: [ self displayInstanceOf: class ];
								with: [ html image url: (class new urlOf: class new teamPlayers anyOne key) ].
							html div
								class: 'desc';
								with: class pageName ] ] ]
]
