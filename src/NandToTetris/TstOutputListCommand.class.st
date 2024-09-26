Class {
	#name : #TstOutputListCommand,
	#superclass : #Object,
	#instVars : [
		'vars'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstOutputListCommand class >> for: anObject [
	|obj|
	obj := self new.
	obj vars: (anObject collect: [:element|element second]).
	^ obj
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> vars: anObject [
	vars := anObject
]
