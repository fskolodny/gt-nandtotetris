Class {
	#name : #DFF,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
DFF >> initialize [
	super initialize.
	inputs at: #in put: nil.
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
DFF >> isClocked [
	^ true
]
