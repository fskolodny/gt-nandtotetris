Class {
	#name : #Xor,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Xor >> a [ 
	^ (inputs at: #a) value.
]

{ #category : #'as yet unclassified' }
Xor >> a: aBit [
	inputs at: #a put: [aBit].
]

{ #category : #'as yet unclassified' }
Xor >> b [ 
	^ (inputs at: #b) value.
]

{ #category : #'as yet unclassified' }
Xor >> b: aBit [
	inputs at: #b put: [aBit].
]

{ #category : #'as yet unclassified' }
Xor >> eval [
	outputs at: #out put: [self a bitXor: self b].
]

{ #category : #'as yet unclassified' }
Xor >> initialize [
	super initialize.
	#(#a #b) do: [:key | inputs at: key put: nil].
	outputs at: #out put: nil.
]

{ #category : #'as yet unclassified' }
Xor >> out [
	^ (outputs at: #out) value.
]
