Class {
	#name : #OrGateTester,
	#superclass : #TestCase,
	#instVars : [
		'orGate'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
OrGateTester >> setUp [
	orGate := NandToTetrisExamples new orGate.
]

{ #category : #'as yet unclassified' }
OrGateTester >> testShouldReturnFalseIfBothInputsAreFalse [
	(orGate pins at: #a) val: false.
	(orGate pins at: #b) val: false.
	orGate eval.
	self assert: (orGate pins at: #out) val equals: false.
]

{ #category : #'as yet unclassified' }
OrGateTester >> testShouldReturnTrueIfBothInputsAreTrue [
	(orGate pins at: #a) val: true.
	(orGate pins at: #b) val: true.
	orGate eval.
	self assert: (orGate pins at: #out) val equals: true.
]

{ #category : #'as yet unclassified' }
OrGateTester >> testShouldReturnTrueIfOneInputIsTrue [
	(orGate pins at: #a) val: true.
	(orGate pins at: #b) val: false.
	orGate eval.
	self assert: (orGate pins at: #out) val equals: true.
	(orGate pins at: #a) val: false.
	(orGate pins at: #b) val: true.
	orGate eval.
	self assert: (orGate pins at: #out) val equals: true.
]
