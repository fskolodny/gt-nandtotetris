Class {
	#name : #Nand,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Nand >> a [
	^ (inputs at: #a) value
]

{ #category : #'as yet unclassified' }
Nand >> a: aValue [
	inputs at: #a put: [aValue]
]

{ #category : #'as yet unclassified' }
Nand >> b [
	^ (inputs at: #b) value
]

{ #category : #'as yet unclassified' }
Nand >> b: aValue [
	inputs at: #b put: [aValue]
]

{ #category : #'as yet unclassified' }
Nand >> eval [
	outputs at: #out put: [((((inputs at: #a) value) bitAnd: ((inputs at: #b) value)) = 0 ifTrue: [1] ifFalse: [0])]
]

{ #category : #'as yet unclassified' }
Nand >> initialize [
	super initialize.
	#(#a #b) do: [ :symbol | inputs at: symbol put: nil ].
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
Nand >> out [
	^ (outputs at: #out) value
]
