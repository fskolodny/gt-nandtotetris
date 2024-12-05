Class {
	#name : #Gate,
	#superclass : #Object,
	#instVars : [
		'pins',
		'dictionary'
	],
	#category : #NandToTetris
}

{ #category : #accessing }
Gate >> dictionary [
	^ dictionary
]

{ #category : #accessing }
Gate >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #'as yet unclassified' }
Gate >> eval [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Gate >> initialize [
	super initialize.
	pins := IdentityDictionary new.
	dictionary := IdentityDictionary new.
]

{ #category : #accessing }
Gate >> pins [
	^ pins
]
