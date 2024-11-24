Class {
	#name : #TstOutputListCommand,
	#superclass : #TstCommand,
	#instVars : [
		'vars',
		'formats'
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
	context outputList: self.
	self printVars: #name.
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
TstOutputListCommand >> printVars: aString [
	| aStream |
	aStream := context outFile.
	1
		to: vars size
		do: [ :i | 
			| format value |
			format := formats at: i.
			aStream nextPut: $|.
			aString = #name
				ifTrue: [
					| len |
					len := format third + format fifth + format seventh.
					value := vars at: i.
					len <= value size
						ifTrue: [ 1 to: len do: [ :j | aStream nextPut: (value at: j) ] ]
						ifFalse: [ 1
								to: ((len - value size) / 2) floor
								do: [ :j | aStream nextPut: Character space ].
							aStream nextPutAll: value.
							1
								to: ((len - value size) / 2) ceiling
								do: [ :j | aStream nextPut: Character space ] ] ]
				ifFalse: [
					1 to: format third do: [ :j | aStream nextPut: Character space ].
					value := context valueAt: (vars at: i).
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
		nextPut: Character linefeed
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> vars: anObject [
	vars := anObject asArray.
]
