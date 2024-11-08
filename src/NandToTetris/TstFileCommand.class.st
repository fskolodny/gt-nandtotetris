Class {
	#name : #TstFileCommand,
	#superclass : #TstCommand,
	#instVars : [
		'fileName'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstFileCommand class >> for: fileName [
	^ self new fileName: fileName asString.
]

{ #category : #accessing }
TstFileCommand >> fileName [
	^ fileName
]

{ #category : #accessing }
TstFileCommand >> fileName: anObject [
	fileName := anObject
]
