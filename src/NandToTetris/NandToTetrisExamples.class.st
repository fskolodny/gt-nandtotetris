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

{ #category : #'as yet unclassified' }
NandToTetrisExamples >> andGate [
	<gtExample>
	| aWire bWire outWire nandGate notGate andGate nandOutWire |
	andGate := CompositeGate new.
	{#a . #b . #out} do: [ :aName | andGate pins at: aName put: Port new ].
	notGate := self notGate.
	nandGate := NandGate new.
	aWire := Wire new.
	aWire source: (andGate pins at: #a); addDestination: (nandGate pins at: #a).
	bWire := Wire new.
	bWire source: (andGate pins at: #b); addDestination: (nandGate pins at: #b).
	nandOutWire := Wire new.
	nandOutWire source: (nandGate pins at: #out); addDestination: (notGate pins at: #in).
	outWire := Wire new.
	outWire source: (notGate pins at: #out); addDestination: (andGate pins at: #out).
	andGate
		parts: {nandGate.
				notGate}.
	^ andGate
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
NandToTetrisExamples >> nandGateSimulator [
	<gtExample>
	^ HardwareSimulator new tstFile: 'Nand.tst'; yourself.
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
NandToTetrisExamples >> notGate [
	<gtExample>
	| inputWire outputWire nandGate notGate |
	notGate := CompositeGate new.
	{#in . #out} do: [ :aPin | notGate pins at: aPin put: Port new].
	nandGate := NandGate new.
	inputWire := Wire new.
	outputWire := Wire new.
	inputWire source: (notGate pins at: #in). {#a . #b} do: [:aPin | inputWire addDestination: (nandGate pins at: aPin)].
	outputWire source: (nandGate pins at: #out); addDestination: (notGate pins at: #out).
	notGate parts: {nandGate}.
	^ notGate
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

{ #category : #'as yet unclassified' }
NandToTetrisExamples >> orGate [
	<gtExample>
	| aWire bWire outWire nandGate notGate1 notGate2 orGate notaWire notbWire |
	orGate := CompositeGate new.
	{#a.
		#b.
		#out} do: [ :aName | orGate pins at: aName put: Port new ].
	notGate1 := self notGate.
	notGate2 := self notGate.
	nandGate := NandGate new.
	aWire := Wire new.
	aWire
		source: (orGate pins at: #a);
		addDestination: (notGate1 pins at: #in).
	bWire := Wire new.
	bWire
		source: (orGate pins at: #b);
		addDestination: (notGate2 pins at: #in).
	notaWire := Wire new.
	notbWire := Wire new.
	notaWire
		source: (notGate1 pins at: #out);
		addDestination: (nandGate pins at: #a).
	notbWire
		source: (notGate2 pins at: #out);
		addDestination: (nandGate pins at: #b).
	outWire := Wire new.
	outWire
		source: (nandGate pins at: #out);
		addDestination: (orGate pins at: #out).
	orGate
		parts: {notGate1.
				notGate2.
				nandGate}.
	^ orGate
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
