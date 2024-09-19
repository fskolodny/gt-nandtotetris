Class {
	#name : #Or,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Or >> a [
	^ (inputs at: #a) value
]

{ #category : #'as yet unclassified' }
Or >> a: aValue [
	inputs at: #a put: [aValue]
]

{ #category : #'as yet unclassified' }
Or >> b [
	^ (inputs at: #b) value
]

{ #category : #'as yet unclassified' }
Or >> b: aValue [
	inputs at: #b put: [aValue]
]

{ #category : #'as yet unclassified' }
Or >> eval [
	outputs at: #out put: [((((inputs at: #a) value) bitOr: ((inputs at: #b) value)) = 1 ifTrue: [1] ifFalse: [0])]
]

{ #category : #'as yet unclassified' }
Or >> initialize [
	super initialize.
	#(#a #b) do: [ :symbol | inputs at: symbol put: nil ].
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
Or >> out [
	^ (outputs at: #out) value
]
