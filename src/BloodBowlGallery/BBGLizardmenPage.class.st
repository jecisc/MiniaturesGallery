Class {
	#name : #BBGLizardmenPage,
	#superclass : #BBGTeamPage,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGLizardmenPage class >> pageName [
	^ 'Lizardmen'
]

{ #category : #accessing }
BBGLizardmenPage class >> priority [
	^ 5
]

{ #category : #accessing }
BBGLizardmenPage >> teamGroups [
	^ OrderedDictionary
		with: 'Kroxi' -> 'IMG_1915_full.jpg'
		with: 'Saurus' -> 'IMG_1913.jpg'
		with: 'Skinks' -> 'IMG_1911.jpg'
		
]

{ #category : #accessing }
BBGLizardmenPage >> teamImages [
	^ OrderedDictionary
		with: 'Full team' -> 'IMG_1908.jpg'
		with: 'Full team from top' -> 'IMG_1909.jpg'
		with: 'Full team from back' -> 'IMG_1910.jpg'
]

{ #category : #accessing }
BBGLizardmenPage >> teamPlayers [
	^ OrderedDictionary new
		at: 'Player 1' put: 'IMG_1915.jpg' -> 'IMG_1916.jpg';
		at: 'Player 2' put: 'IMG_1917.jpg' -> 'IMG_1918.jpg';
		at: 'Player 3' put: 'IMG_1919.jpg' -> 'IMG_1920.jpg';
		at: 'Player 4' put: 'IMG_1921.jpg' -> 'IMG_1922.jpg';
		at: 'Player 5' put: 'IMG_1923.jpg' -> 'IMG_1924.jpg';
		at: 'Player 6' put: 'IMG_1925.jpg' -> 'IMG_1926.jpg';
		at: 'Player 7' put: 'IMG_1927.jpg' -> 'IMG_1928.jpg';
		at: 'Player 8' put: 'IMG_1929.jpg' -> 'IMG_1930.jpg';
		at: 'Player 9' put: 'IMG_1931.jpg' -> 'IMG_1932.jpg';
		at: 'Player 10' put: 'IMG_1933.jpg' -> 'IMG_1934.jpg';
		at: 'Player 11' put: 'IMG_1935.jpg' -> 'IMG_1936.jpg';
		at: 'Player 12' put: 'IMG_1937.jpg' -> 'IMG_1938.jpg';
		at: 'Player 13' put: 'IMG_1939.jpg' -> 'IMG_1940.jpg';
		at: 'Player 14' put: 'IMG_1941.jpg' -> 'IMG_1942.jpg';
		at: 'Player 15' put: 'IMG_1943.jpg' -> 'IMG_1944.jpg';
		at: 'Player 16' put: 'IMG_1945.jpg' -> 'IMG_1946.jpg';
		at: 'Player 17' put: 'IMG_1947.jpg' -> 'IMG_1948.jpg';
		at: 'Player 18' put: 'IMG_1949.jpg' -> 'IMG_1950.jpg';
		yourself
]
