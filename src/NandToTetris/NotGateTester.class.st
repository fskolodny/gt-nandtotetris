Class {
	#name : #NotGateTester,
	#superclass : #TestCase,
	#instVars : [
		'notGate'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
NotGateTester >> setUp [
	notGate := NandToTetrisExamples new notGate.
]

{ #category : #'as yet unclassified' }
NotGateTester >> testShouldBeFalseIfInputIsTrue [
	(notGate pins at: #in) val: true.
	notGate eval.
	self assert: (notGate pins at: #out) val equals: false
]

{ #category : #'as yet unclassified' }
NotGateTester >> testShouldBeTrueIfInputIsFalse [
	(notGate pins at: #in) val: false.
	notGate eval.
	self assert: (notGate pins at: #out) val equals: true
]
