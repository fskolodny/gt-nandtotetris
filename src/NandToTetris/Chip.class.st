Class {
	#name : #Chip,
	#superclass : #Object,
	#instVars : [
		'inputs',
		'outputs'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Chip >> eval [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Chip >> initialize [
	super initialize.
	inputs := IdentityDictionary new.
	outputs := IdentityDictionary new.
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
