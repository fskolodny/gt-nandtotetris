Class {
	#name : #TstLoadCommand,
	#superclass : #Object,
	#instVars : [
		'fileName'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstLoadCommand class >> with: s1 and: s2 [
	^ (self new) fileName: (s1 asString , s2 asString).
]

{ #category : #'as yet unclassified' }
TstLoadCommand >> fileName: anObject [
	fileName := anObject
]
