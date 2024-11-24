Class {
	#name : #HalfAdder,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HalfAdder >> a [
	^ inputs at: #a
]

{ #category : #'as yet unclassified' }
HalfAdder >> a: aBit [
	inputs at: #a put: aBit.
]

{ #category : #'as yet unclassified' }
HalfAdder >> b [
	^ inputs at: #b
]

{ #category : #'as yet unclassified' }
HalfAdder >> b: aBit [
	inputs at: #b put: aBit
]

{ #category : #'as yet unclassified' }
HalfAdder >> carry [
	^ outputs at: #carry
]

{ #category : #'as yet unclassified' }
HalfAdder >> eval [
	outputs at: #sum put: (self a bitXor: self b).
	outputs at: #carry put: (self a bitAnd: self b).
]

{ #category : #'as yet unclassified' }
HalfAdder >> initialize [
	super initialize.
	#(#a #b) do: [:aSymbol | inputs at: aSymbol put: nil].
	#(#sum #carry) do: [:aSymbol | outputs at: aSymbol put: nil].
]

{ #category : #'as yet unclassified' }
HalfAdder >> sum [
	^ outputs at: #sum
]
