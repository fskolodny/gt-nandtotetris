Class {
	#name : #NandToTetrisExamples,
	#superclass : #Object,
	#category : #NandToTetris
}

{ #category : #accessing }
NandToTetrisExamples >> nandExample [
	<gtExample>
	| nand |
	nand := Nand new.
	self
		assert: (nand
				a: 1;
				b: 1;
				eval;
				out) equals: 0.
	self
		assert: (nand
				a: 1;
				b: 0;
				eval;
				out) equals: 1.
	self
		assert: (nand
				a: 0;
				b: 1;
				eval;
				out) equals: 1.
	self
		assert: (nand
				a: 0;
				b: 0;
				eval;
				out) equals: 1.
	^ nand
]

{ #category : #accessing }
NandToTetrisExamples >> notExample [
	<gtExample>
	| not |
	not := Not new.
	self
		assert: (not
				in: 1;
				eval;
				out) equals: 0.
	self
		assert: (not
				in: 0;
				eval;
				out) equals: 1.
	^ not
]
