Class {
	#name : #BBGKhemriPage,
	#superclass : #BBGTeamPage,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #accessing }
BBGKhemriPage class >> pageName [
	^ 'Khemri'
]

{ #category : #accessing }
BBGKhemriPage class >> priority [
	^ 2
]

{ #category : #accessing }
BBGKhemriPage >> teamGroups [
	^ OrderedDictionary
		with: 'Tomb Guardians' -> 'IMG_1415.JPG'
		with: 'Blitz-ras and Throw-ras' -> 'IMG_1416.JPG'
		with: 'Skeletons' -> 'IMG_1417.JPG'
]

{ #category : #accessing }
BBGKhemriPage >> teamImages [
	^ OrderedDictionary
		with: 'Full team' -> 'IMG_1418.JPG'
		with: 'Full team from top' -> 'IMG_1419.JPG'
		with: 'Full team from back' -> 'IMG_1420.JPG'
]

{ #category : #accessing }
BBGKhemriPage >> teamPlayers [
	^ OrderedDictionary new
		at: 'Player 1' put: 'IMG_1369.JPG' -> 'IMG_1370.JPG';
		at: 'Player 2' put: 'IMG_1371.JPG' -> 'IMG_1372.JPG';
		at: 'Player 3' put: 'IMG_1373.JPG' -> 'IMG_1374.JPG';
		at: 'Player 4' put: 'IMG_1375.JPG' -> 'IMG_1376.JPG';
		at: 'Player 5' put: 'IMG_1377.JPG' -> 'IMG_1378.JPG';
		at: 'Player 6' put: 'IMG_1379.JPG' -> 'IMG_1380.JPG';
		at: 'Player 7' put: 'IMG_1395.JPG' -> 'IMG_1396.JPG';
		at: 'Player 8' put: 'IMG_1397.JPG' -> 'IMG_1398.JPG';
		at: 'Player 9' put: 'IMG_1399.JPG' -> 'IMG_1400.JPG';
		at: 'Player 10' put: 'IMG_1401.JPG' -> 'IMG_1402.JPG';
		at: 'Player 11' put: 'IMG_1403.JPG' -> 'IMG_1404.JPG';
		at: 'Player 12' put: 'IMG_1405.JPG' -> 'IMG_1406.JPG';
		at: 'Player 13' put: 'IMG_1407.JPG' -> 'IMG_1408.JPG';
		at: 'Player 14' put: 'IMG_1409.JPG' -> 'IMG_1410.JPG';
		at: 'Player 15' put: 'IMG_1411.JPG' -> 'IMG_1412.JPG';
		at: 'Player 16' put: 'IMG_1413.JPG' -> 'IMG_1414.JPG';
		yourself
]
