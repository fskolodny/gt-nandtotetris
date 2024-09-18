Class {
	#name : #Not,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Not >> eval [
	outputs at: #out put: (self in = 1 ifTrue: [0] ifFalse: [1])
]

{ #category : #'as yet unclassified' }
Not >> in [
	^ (inputs at: #in) value
]

{ #category : #'as yet unclassified' }
Not >> in: aValue [
	inputs at: #in put: [aValue]
]

{ #category : #'as yet unclassified' }
Not >> initialize [
	super initialize.
	inputs at: #in put: nil.
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
Not >> out [
	^ (outputs at: #out) value
]
