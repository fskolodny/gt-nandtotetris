Class {
	#name : #TstFile,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstFile class >> for: node [
	^ self new rawData: node
]

{ #category : #accessing }
TstFile >> rawData [
	^ rawData
]

{ #category : #accessing }
TstFile >> rawData: anObject [
	rawData := anObject asArray
]
