Class {
	#name : #TstOutputListCommand,
	#superclass : #TstCommand,
	#instVars : [
		'vars',
		'formats',
		'lengths'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstOutputListCommand class >> for: anObject [
	| obj |
	obj := self new.
	obj vars: (anObject collect: [ :element | element second ]). obj formats: (anObject collect: [ :element | element third ]).
	^ obj
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> execute [
	| line |
	context outputList: self.
	line := self printVars: #name.
	context compareLine: line
]

{ #category : #accessing }
TstOutputListCommand >> formats [
	^ formats
]

{ #category : #accessing }
TstOutputListCommand >> formats: anObject [
	formats := anObject asArray
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> initialize [
	super initialize.
	lengths := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> printVars: aString [
	| aStream line |
	aStream := WriteStream on: String new.
	1
		to: vars size
		do: [ :i | 
			| format value len |
			format := formats at: i.
			aStream nextPut: $|.
			aString = #name
				ifTrue: [ 
				value := vars at: i.
					len := format third + format fifth + format seventh.
					lengths add: len.
					len > value size
						ifFalse: [ aStream nextPutAll: (value truncateTo: len) ]
						ifTrue: [ 1
								to: ((len - value size) / 2) floor
								do: [ :j | aStream nextPut: Character space ].
							aStream nextPutAll: value.
							1
								to: ((len - value size) / 2) ceiling
								do: [ :j | aStream nextPut: Character space ] ] ]
				ifFalse: [ 
					len := lengths at: i.
					1 to: format third do: [ :j | aStream nextPut: Character space ].
					value := context valueAt: (vars at: i).
					(value == false) ifTrue: [value := 0] ifFalse: [(value == true) ifTrue: [value := 1]].
					format second = $B
						ifTrue: [ 15
								to: 16 - format fifth
								by: -1
								do: [ :j | (value bitAt: j + 1) printOn: aStream ] ]
						ifFalse: [ value
								printOn: aStream
								base: (format second = $D ifTrue: 10 ifFalse: 16) ].
					1 to: format seventh do: [ :j | aStream nextPut: Character space ] ] ].
	aStream
		nextPut: $|;
		close.
	line := aStream contents.
	context outFile
		nextPutAll: line;
		nextPut: Character linefeed.
	^ line
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> vars: anObject [
	vars := anObject asArray.
]
