Class {
	#name : #BBGHumansPage,
	#superclass : #BBGTeamPage,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGHumansPage class >> pageName [
	^ 'Humans'
]

{ #category : #accessing }
BBGHumansPage class >> priority [
	^ 20
]

{ #category : #accessing }
BBGHumansPage >> teamGroups [
	^ OrderedDictionary
		with: 'Ogre' -> 'IMG_3306.JPG'
		with: 'Blitzeurs' -> 'IMG_3308.JPG'
		with: 'Lanceurs' -> 'IMG_3310.JPG'
		with: 'Receveurs' -> 'IMG_3312.JPG'
		with: 'Linemans' -> 'IMG_3314.JPG'
]

{ #category : #accessing }
BBGHumansPage >> teamImages [
	^ OrderedDictionary
		with: 'Full team' -> 'IMG_3303.JPG'
		with: 'Full team from top' -> 'IMG_3304.JPG'
		with: 'Full team from back' -> 'IMG_3305.JPG'
]

{ #category : #accessing }
BBGHumansPage >> teamPlayers [
	^ OrderedDictionary new
		at: 'Player 1' put: 'IMG_3306.JPG' -> 'IMG_3307.JPG';
		at: 'Player 2' put: 'IMG_3316.JPG' -> 'IMG_3317.JPG';
		at: 'Player 3' put: 'IMG_3318.JPG' -> 'IMG_3319.JPG';
		at: 'Player 4' put: 'IMG_3320.JPG' -> 'IMG_3321.JPG';
		at: 'Player 5' put: 'IMG_3322.JPG' -> 'IMG_3323.JPG';
		at: 'Player 6' put: 'IMG_3324.JPG' -> 'IMG_3325.JPG';
		at: 'Player 7' put: 'IMG_3326.JPG' -> 'IMG_3327.JPG';
		at: 'Player 8' put: 'IMG_3328.JPG' -> 'IMG_3329.JPG';
		at: 'Player 9' put: 'IMG_3330.JPG' -> 'IMG_3331.JPG';
		at: 'Player 10' put: 'IMG_3332.JPG' -> 'IMG_3333.JPG';
		at: 'Player 11' put: 'IMG_3334.JPG' -> 'IMG_3335.JPG';
		at: 'Player 12' put: 'IMG_3336.JPG' -> 'IMG_3337.JPG';
		at: 'Player 13' put: 'IMG_3338.JPG' -> 'IMG_3339.JPG';
		at: 'Player 14' put: 'IMG_3340.JPG' -> 'IMG_3341.JPG';
		at: 'Player 15' put: 'IMG_3342.JPG' -> 'IMG_3343.JPG';
		at: 'Player 16' put: 'IMG_3344.JPG' -> 'IMG_3345.JPG';
		at: 'Player 17' put: 'IMG_3346.JPG' -> 'IMG_3347.JPG';
		at: 'Player 18' put: 'IMG_3348.JPG' -> 'IMG_3349.JPG';
		at: 'Player 19' put: 'IMG_3350.JPG' -> 'IMG_3351.JPG';
		yourself
]
