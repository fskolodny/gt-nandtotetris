Class {
	#name : #CompositeGate,
	#superclass : #Gate,
	#instVars : [
		'parts'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
CompositeGate >> eval [
	parts do: [ :aGate | aGate eval ].
]

{ #category : #accessing }
CompositeGate >> parts [
	^ parts
]

{ #category : #accessing }
CompositeGate >> parts: aSequence [
	parts := aSequence
]
