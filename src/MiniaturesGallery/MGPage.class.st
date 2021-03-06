"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #MGPage,
	#superclass : #MGComponent,
	#category : #'MiniaturesGallery-Core'
}

{ #category : #testing }
MGPage class >> isAbstract [
	^ self = MGPage
]

{ #category : #accessing }
MGPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
MGPage class >> pages [
	^ { self }
]

{ #category : #accessing }
MGPage class >> pagesToDisplay [
	^ (self allSubclasses flatCollect: #pages) sorted: #priority ascending
]

{ #category : #accessing }
MGPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
MGPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
MGPage >> pageName [
	^ self class pageName
]

{ #category : #accessing }
MGPage >> pageTitle [
	^ self pageName
]

{ #category : #accessing }
MGPage >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #rendering }
MGPage >> renderContentOn: html [
	html div
		style: 'max-width: 1250px; min-height: 600px; margin: 0 auto; padding: 20px 8px; background-color: rgba(255,255,255,0.95); overflow: auto';
		with: [ html heading
				level2;
				mdlTypographyTitle;
				with: self pageTitle.
			self renderPageContentOn: html ]
]

{ #category : #rendering }
MGPage >> renderPageContentOn: html [
	self subclassResponsibility
]
