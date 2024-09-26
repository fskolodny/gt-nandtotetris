Class {
	#name : #TstFileCommand,
	#superclass : #Object,
	#instVars : [
		'fileName'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstFileCommand class >> for: base and: suffix [
	^ self new fileName: (base asString , suffix asString).
]

{ #category : #accessing }
TstFileCommand >> fileName [
	^ fileName
]

{ #category : #accessing }
TstFileCommand >> fileName: anObject [
	fileName := anObject
]
