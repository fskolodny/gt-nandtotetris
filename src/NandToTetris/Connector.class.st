Class {
	#name : #Connector,
	#superclass : #Object,
	#instVars : [
		'source',
		'destinations'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Connector >> addDestination: aPort [
	destinations add: aPort
]

{ #category : #'as yet unclassified' }
Connector >> initialize [
	super initialize.
	destinations := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Connector >> source: aPort [
	source ifNotNil: [source removeObserver: self].
	source := aPort.
	aPort addObserver: self.
]

{ #category : #'as yet unclassified' }
Connector >> val: aValue [
	self subclassResponsibility
]
