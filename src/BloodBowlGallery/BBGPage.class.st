"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #BBGPage,
	#superclass : #BBGComponent,
	#category : #'BloodBowlGallery-Core'
}

{ #category : #testing }
BBGPage class >> isAbstract [
	^ self = BBGPage
]

{ #category : #accessing }
BBGPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
BBGPage class >> pages [
	^ { self }
]

{ #category : #accessing }
BBGPage class >> pagesToDisplay [
	^ (self allSubclasses flatCollect: #pages) sorted: #priority ascending
]

{ #category : #accessing }
BBGPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
BBGPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
BBGPage >> pageName [
	^ self class pageName
]

{ #category : #accessing }
BBGPage >> pageTitle [
	^ self pageName
]

{ #category : #accessing }
BBGPage >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #rendering }
BBGPage >> renderContentOn: html [
	html div
		style: 'max-width: 1250px; min-height: 600px; margin: 0 auto; padding: 20px 8px; background-color: rgba(255,255,255,0.95); overflow: auto';
		with: [ html heading
				level2;
				mdlTypographyTitle;
				with: self pageTitle.
			self renderPageContentOn: html ]
]

{ #category : #rendering }
BBGPage >> renderPageContentOn: html [
	self subclassResponsibility
]
