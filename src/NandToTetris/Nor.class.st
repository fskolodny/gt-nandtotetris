Class {
	#name : #Nor,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Nor >> a [
	^ (inputs at: #a) value
]

{ #category : #'as yet unclassified' }
Nor >> a: aValue [
	inputs at: #a put: [aValue]
]

{ #category : #'as yet unclassified' }
Nor >> b [
	^ (inputs at: #b) value
]

{ #category : #'as yet unclassified' }
Nor >> b: aValue [
	inputs at: #b put: [aValue]
]

{ #category : #'as yet unclassified' }
Nor >> eval [
	outputs at: #out put: [((((inputs at: #a) value) bitOr: ((inputs at: #b) value)) = 1 ifTrue: [0] ifFalse: [1])]
]

{ #category : #'as yet unclassified' }
Nor >> initialize [
	super initialize.
	#(#a #b) do: [ :symbol | inputs at: symbol put: nil ].
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
Nor >> out [
	^ (outputs at: #out) value
]
