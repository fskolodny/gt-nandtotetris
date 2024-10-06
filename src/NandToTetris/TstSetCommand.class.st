Class {
	#name : #TstSetCommand,
	#superclass : #TstCommand,
	#instVars : [
		'var',
		'value'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstSetCommand class >> var: anObject value: anObject1 [
	^ self new var: anObject; value: anObject1
]

{ #category : #'as yet unclassified' }
TstSetCommand >> execute [
	context set: var to: value
]

{ #category : #accessing }
TstSetCommand >> value1 [
	^ value
]

{ #category : #accessing }
TstSetCommand >> value: anObject [
	value := anObject
]

{ #category : #accessing }
TstSetCommand >> var [
	^ var
]

{ #category : #accessing }
TstSetCommand >> var: anObject [
	var := anObject
]
