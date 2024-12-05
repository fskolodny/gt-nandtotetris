Class {
	#name : #NandGateTester,
	#superclass : #TestCase,
	#instVars : [
		'nandGate'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
NandGateTester >> setUp [
	nandGate := NandGate new.
]

{ #category : #'as yet unclassified' }
NandGateTester >> testShouldOutputTrueWhenBothInputsAreFalse [
	nandGate a: false; b: false.
	nandGate eval.
	self assert: nandGate out equals: true
]

{ #category : #'as yet unclassified' }
NandGateTester >> testShouldOutputTrueWhenBothInputsAreTrue [
	nandGate a: true; b: true.
	nandGate eval.
	self assert: nandGate out equals: false
]

{ #category : #'as yet unclassified' }
NandGateTester >> testShouldOutputTrueWhenOneeInputIsFalse [
	nandGate a: false; b: true.
	nandGate eval.
	self assert: nandGate out equals: true.
	nandGate a: true; b: false.
	nandGate eval.
	self assert: nandGate out equals: true
]
