Class {
	#name : #And,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
And >> a [
	^ (inputs at: #a) value
]

{ #category : #'as yet unclassified' }
And >> a: aValue [
	inputs at: #a put: [aValue]
]

{ #category : #'as yet unclassified' }
And >> b [
	^ (inputs at: #b) value
]

{ #category : #'as yet unclassified' }
And >> b: aValue [
	inputs at: #b put: [aValue]
]

{ #category : #'as yet unclassified' }
And >> eval [
	outputs at: #out put: [((((inputs at: #a) value) bitAnd: ((inputs at: #b) value)) = 1 ifTrue: [1] ifFalse: [0])]
]

{ #category : #'as yet unclassified' }
And >> initialize [
	super initialize.
	#(#a #b) do: [ :symbol | inputs at: symbol put: nil ].
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
And >> out [
	^ (outputs at: #out) value
]
