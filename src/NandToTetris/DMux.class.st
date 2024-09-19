Class {
	#name : #DMux,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
DMux >> a [
	^ (outputs at: #a) value
]

{ #category : #'as yet unclassified' }
DMux >> b [ 
	^ (outputs at: #b) value
]

{ #category : #'as yet unclassified' }
DMux >> eval [
	(inputs at: #sel) value = 0 ifTrue: [outputs at: #a put: (inputs at: #in) value; at: #b put: [0]] ifFalse: [outputs at: #b put: (inputs at: #in) value; at: #a put: [0]]
]

{ #category : #'as yet unclassified' }
DMux >> in: aBit [
	inputs at: #in put: [aBit]
]

{ #category : #'as yet unclassified' }
DMux >> initialize [
	#(#in #sel) do: [:key | inputs at: key put: nil].
	#(#a #b) do: [:key | outputs at: key put: nil]
]

{ #category : #'as yet unclassified' }
DMux >> sel: aBit [
	inputs at: #sel put: [aBit]
]
