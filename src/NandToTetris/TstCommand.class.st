Class {
	#name : #TstCommand,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #NandToTetris
}

{ #category : #accessing }
TstCommand >> context [
	^ context
]

{ #category : #accessing }
TstCommand >> context: anObject [
	context := anObject
]

{ #category : #'as yet unclassified' }
TstCommand >> execute [
	self subclassResponsibility
]
