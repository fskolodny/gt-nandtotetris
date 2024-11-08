Class {
	#name : #HdlFileGrammar,
	#superclass : #NandFileGrammar,
	#instVars : [
		'inLine',
		'outLine',
		'hdlFile',
		'pinName',
		'chipName',
		'parts',
		'builtIn',
		'part',
		'pinAssignment',
		'pinNames',
		'pinAssignments',
		'range',
		'subscript',
		'name'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HdlFileGrammar >> builtIn [
	^ (('BUILTIN' asPParser , ignorable plus, chipName , semi) trim: ignorable)
	==> [ :node | { node first . node third }]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> chipName [
	^ name
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> hdlFile [
	^ (ignorable star , 'CHIP' asPParser , ignorable plus , chipName, lBrace , inLine, outLine , (parts / builtIn) trim: ignorable , rBrace  , ignorable star end)
	==> [ :node | { node at:4 . node at: 6 . node at: 7 . node at: 8 } ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> inLine [
	^ ('IN' asPParser , ignorable plus , pinNames , semi) trim: ignorable
	==> [ :node | node third ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> name [
	^ ((#letter asPParser , #word asPParser star) trim:ignorable) flatten
	==> [ :node | node asSymbol ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> outLine [
	^ ('OUT' asPParser , ignorable plus , pinNames , semi) trim: ignorable
	==> [ :node | node third ]	
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> part [
	^ chipName , lParen ,  pinAssignments, rParen , semi , ignorable star
	==> [ :node | { node first . node third }]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> parts [
	^ 'PARTS:' asPParser , ignorable star , (part plus ==> [ :node | node asArray])
	==> [ :node | { node first . node third } ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinAssignment [
	^ pinName , $= asPParser , pinName
	==> [ :node | { node first . node third } ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinAssignments [
	^ (pinAssignment , ((comma , pinAssignment) ==> [ :node | node second ]) star)
		==> [ :node |  (OrderedCollection new add: node first; addAll: node second; yourself) asArray  ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinName [
	^ name , subscript optional
	==> [ :node | node at:1 put: node first asSymbol. node second isNil ifTrue: [node first] ifFalse: [node]]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinNames [
	^ (pinName , ((comma , pinName) ==> [:node | node second]) star)
	==> [ :node | (OrderedCollection new add: node first; addAll: node second; yourself) asArray ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> range [
	^ number , '..' asPParser , number
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> start [
	^ hdlFile
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> subscript [
	^ $[ asPParser , (range / number) , $] asPParser
	==> [:node | node second]
]
