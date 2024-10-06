Class {
	#name : #TstOutputListCommand,
	#superclass : #TstCommand,
	#instVars : [
		'vars',
		'len'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstOutputListCommand class >> for: anObject [
	|obj|
	obj := self new.
	obj vars: (anObject collect: [:element|element second]).
	^ obj
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> execute [
	context outputList: self.
	self printVars: #name.
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> printVars: aString [
	vars do: [ :var |
		| value |
		value := (aString = #name ifTrue: [var] ifFalse: [context valueAt: var]) asString.
		context outFile nextPut: $|.
		1 to: ((len - (value size) / 2) floor) do: [:i| context outFile nextPutAll: ' '].
		context outFile nextPutAll: value.
		1 to: ((len - (value size) / 2) ceiling) do: [:i| context outFile nextPutAll: ' '].
		].
		context outFile nextPut: $|; cr.
]

{ #category : #'as yet unclassified' }
TstOutputListCommand >> vars: anObject [
	vars := anObject.
	len := (vars collect: [ :var | var size]) max
]
