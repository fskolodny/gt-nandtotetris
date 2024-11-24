Class {
	#name : #Nor,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Nor >> a [
	^ inputs at: #a
]

{ #category : #'as yet unclassified' }
Nor >> a: aValue [
	inputs at: #a put: aValue
]

{ #category : #'as yet unclassified' }
Nor >> b [
	^ inputs at: #b
]

{ #category : #'as yet unclassified' }
Nor >> b: aValue [
	inputs at: #b put: aValue
]

{ #category : #'as yet unclassified' }
Nor >> eval [
	outputs at: #out put: ((self a bitOr: self b) = 1 ifTrue: [0] ifFalse: [1])
]

{ #category : #'as yet unclassified' }
Nor >> initialize [
	super initialize.
	#(#a #b) do: [ :symbol | inputs at: symbol put: nil ].
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
Nor >> out [
	^ outputs at: #out
]
