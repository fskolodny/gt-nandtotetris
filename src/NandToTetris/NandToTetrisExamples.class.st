Class {
	#name : #NandToTetrisExamples,
	#superclass : #Object,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
NandToTetrisExamples >> andExample [
	<gtExample>
	| and |
	and := And new.
	self
		assert: (and
				a: 1;
				b: 1;
				eval;
				out) equals: 1.
	self
		assert: (and
				a: 1;
				b: 0;
				eval;
				out) equals: 0.
	self
		assert: (and
				a: 0;
				b: 1;
				eval;
				out) equals: 0.
	self
		assert: (and
				a: 0;
				b: 0;
				eval;
				out) equals: 0.
	^ and
]

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

{ #category : #accessing }
NandToTetrisExamples >> notGateSimulator [
	<gtExample>
	| simulator |
	simulator := HardwareSimulator new.
	simulator tstFile: 'Not.tst'.
	^ simulator
]

{ #category : #'as yet unclassified' }
NandToTetrisExamples >> orExample [
	<gtExample>
	| or |
	or := Or new.
	self assert: (or a: 0; b: 0; eval; out) equals: 0.
	self assert: (or a: 0; b: 1; eval; out) equals: 1.
	self assert: (or a: 1; b: 0; eval; out) equals: 1.
	self assert: (or a: 1; b: 1; eval; out) equals: 1.
	^ or.
]

{ #category : #accessing }
NandToTetrisExamples >> tstFileParser [
	<gtExample>
	| contents tstFile |
	tstFile := TstFileGrammar new.
	contents := (FileSystem workingDirectory parent / 'And.tst') contents.
	^ tstFile parse: contents
]

{ #category : #'as yet unclassified' }
NandToTetrisExamples >> xorExample [
	<gtExample>
	| xor |
	xor := Xor new.
	self assert: (xor a: 0; b: 0; eval; out) equals: 0.
	self assert: (xor a: 0; b: 1; eval; out) equals: 1.
	self assert: (xor a: 1; b: 0; eval; out) equals: 1.
	self assert: (xor a: 1; b: 1; eval; out) equals: 0.
	^ xor
]
