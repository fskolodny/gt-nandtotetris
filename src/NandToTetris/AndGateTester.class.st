Class {
	#name : #AndGateTester,
	#superclass : #TestCase,
	#instVars : [
		'andGate'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
AndGateTester >> setUp [
	andGate := NandToTetrisExamples new andGate
]

{ #category : #'as yet unclassified' }
AndGateTester >> testShouldOutputFalseWhenBothInputsAreFalse [
	(andGate pins at: #a) val: false.
	(andGate pins at: #b) val: false.
	andGate eval.
	self assert: (andGate pins at: #out) val equals: false
]

{ #category : #'as yet unclassified' }
AndGateTester >> testShouldOutputFalseWhenOneeInputIsFalse [
	(andGate pins at: #a) val: false.
	(andGate pins at: #b) val: true.
	andGate eval.
	self assert: (andGate pins at: #out) val equals: false.
	(andGate pins at: #a) val: true.
	(andGate pins at: #b) val: false.
	andGate eval.
	self assert: (andGate pins at: #out) val equals: false.
]

{ #category : #'as yet unclassified' }
AndGateTester >> testShouldOutputTrueWhenBothInputsAreTrue [
	(andGate pins at: #a) val: true.
	(andGate pins at: #b) val: true.
	andGate eval.
	self assert: (andGate pins at: #out) val equals: true
]
