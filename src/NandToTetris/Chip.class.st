Class {
	#name : #Chip,
	#superclass : #Object,
	#instVars : [
		'inputs',
		'outputs',
		'dictionary'
	],
	#category : #NandToTetris
}

{ #category : #accessing }
Chip >> dictionary [
	^ dictionary
]

{ #category : #accessing }
Chip >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #'as yet unclassified' }
Chip >> eval [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Chip >> initialize [
	super initialize.
	inputs := IdentityDictionary new.
	outputs := IdentityDictionary new.
	dictionary := IdentityDictionary new.
]

{ #category : #'as yet unclassified' }
Chip >> inputs [
	^ inputs
]

{ #category : #'as yet unclassified' }
Chip >> isClocked [
	^ false
]

{ #category : #'as yet unclassified' }
Chip >> outputs [
	^ outputs.
]
