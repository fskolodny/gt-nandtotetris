Class {
	#name : #FullAdder,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
FullAdder >> a [
	^ inputs at: #a
]

{ #category : #'as yet unclassified' }
FullAdder >> a: aBit [
	inputs at: #a put: aBit
]

{ #category : #'as yet unclassified' }
FullAdder >> b [
	^ inputs at: #b
]

{ #category : #'as yet unclassified' }
FullAdder >> b: aBit [
	inputs at: #b put: aBit
]

{ #category : #'as yet unclassified' }
FullAdder >> c [
	^ inputs at: #c
]

{ #category : #'as yet unclassified' }
FullAdder >> c: aBit [
	inputs at: #c put: aBit
]

{ #category : #'as yet unclassified' }
FullAdder >> carry [
	^ outputs at: #carry
]

{ #category : #'as yet unclassified' }
FullAdder >> eval [
	| halfAdder1 halfAdder2|
	halfAdder1 := HalfAdder new a: self a; b: self b; eval.
	halfAdder2 := HalfAdder new a: halfAdder1 sum; b: self c; eval.
	outputs at: #sum put: halfAdder2 sum.
	outputs at: #carry put: (halfAdder1 carry bitOr: halfAdder2 carry).
]

{ #category : #'as yet unclassified' }
FullAdder >> initialize [
	super initialize.
	#(#a #b #c) do: [ :aSymbol | inputs at: aSymbol put: nil].
	#(#carry #sum) do: [ :aSymbol | outputs at: aSymbol put: nil].
]

{ #category : #'as yet unclassified' }
FullAdder >> sum [
	^ outputs at: #sum
]
