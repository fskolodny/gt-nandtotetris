Class {
	#name : #Cable,
	#superclass : #Connector,
	#instVars : [
		'wires'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Cable class >> new [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
Cable class >> wireCount: aCount [
	| cable |
	cable := self basicNew initialize.
	cable wires: (Array new: aCount).
	^ cable
]

{ #category : #'as yet unclassified' }
Cable >> val: anInteger [
	1
		to: wires size
		do: [ :bitNumber | 
			| aBit |
			wires do: [ :aWire | aWire val: aBit ] ]
]

{ #category : #accessing }
Cable >> wires [
	^ wires
]

{ #category : #accessing }
Cable >> wires: anObject [
	wires := anObject
]
