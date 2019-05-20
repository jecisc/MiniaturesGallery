Class {
	#name : #BBGSkavensPage,
	#superclass : #BBGTeamPage,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGSkavensPage class >> pageName [
	^ 'Skavens'
]

{ #category : #accessing }
BBGSkavensPage class >> priority [
	^ 10
]

{ #category : #accessing }
BBGSkavensPage >> teamGroups [
	^ OrderedDictionary
		with: 'Rat Ogre' -> 'IMG_2296.JPG'
		with: 'Blitzers' -> 'IMG_2298.JPG'
		with: 'Throwers ' -> 'IMG_2299.JPG'
		with: 'Gutter Runners' -> 'IMG_2300.JPG'
		with: 'Linemen' -> 'IMG_2301.JPG'
		
]

{ #category : #accessing }
BBGSkavensPage >> teamImages [
	^ OrderedDictionary
		with: 'Full team' -> 'IMG_2293.JPG'
		with: 'Full team from top' -> 'IMG_2294.JPG'
		with: 'Full team from back' -> 'IMG_2295.JPG'
]

{ #category : #accessing }
BBGSkavensPage >> teamPlayers [
	^ OrderedDictionary new
		at: 'Player 1' put: 'IMG_2303.JPG' -> 'IMG_2304.JPG';
		at: 'Player 2' put: 'IMG_2305.JPG' -> 'IMG_2306.JPG';
		at: 'Player 3' put: 'IMG_2307.JPG' -> 'IMG_2308.JPG';
		at: 'Player 4' put: 'IMG_2309.JPG' -> 'IMG_2310.JPG';
		at: 'Player 5' put: 'IMG_2311.JPG' -> 'IMG_2312.JPG';
		at: 'Player 6' put: 'IMG_2313.JPG' -> 'IMG_2314.JPG';
		at: 'Player 7' put: 'IMG_2315.JPG' -> 'IMG_2316.JPG';
		at: 'Player 8' put: 'IMG_2317.JPG' -> 'IMG_2318.JPG';
		at: 'Player 9' put: 'IMG_2319.JPG' -> 'IMG_2320.JPG';
		at: 'Player 10' put: 'IMG_2321.JPG' -> 'IMG_2322.JPG';
		at: 'Player 11' put: 'IMG_2323.JPG' -> 'IMG_2324.JPG';
		at: 'Player 12' put: 'IMG_2325.JPG' -> 'IMG_2326.JPG';
		at: 'Player 13' put: 'IMG_2327.JPG' -> 'IMG_2328.JPG';
		at: 'Player 14' put: 'IMG_2329.JPG' -> 'IMG_2330.JPG';
		at: 'Player 15' put: 'IMG_2331.JPG' -> 'IMG_2332.JPG';
		yourself
]
