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
		'pinAssignments'
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
	^ pinName
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> hdlFile [
	^ (ignorable star , 'CHIP' asPParser , ignorable plus , chipName, lBrace , inLine, outLine , (parts / builtIn) trim: ignorable , rBrace  , ignorable star end)
	==> [ :node | { node at:4 . node at: 6 . node at: 7 . node at: 8 } ]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> inLine [
	^ ('IN' asPParser , #word asPParser not , pinNames , semi) trim: ignorable.
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> outLine [
	^ ('OUT' asPParser , #word asPParser not , pinNames , semi) trim: ignorable.
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> part [
	^ (chipName , lParen ,  pinAssignments, rParen , semi)
	==> [ :node | { node first . node third }]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> parts [
	^ ('PARTS:' asPParser  , ignorable star , part plus)
	==> [ :node | { node first . node third }]
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinAssignment [
	^ pinName , $= asPParser , pinName
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinAssignments [
	^ pinAssignment , ((comma, pinAssignment) ==> [ :node | node second]) star
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinName [
	^ (#letter asPParser , #word asPParser star) flatten trim: ignorable 
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinNames [
	^ (pinName , ((comma , pinName) ==> [:node|node second]) star)
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> start [
	^ hdlFile
]
