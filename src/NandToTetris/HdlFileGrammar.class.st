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
		'pinAssignment'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HdlFileGrammar >> builtIn [
	^ ('BUILTIN' asPParser , ignorable plus, chipName , semi) trim: ignorable
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> chipName [
	^ pinName
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> hdlFile [
	^ ignorable star , 'CHIP' asPParser , ignorable plus , chipName, lBrace , inLine, outLine , (parts / builtIn) trim: ignorable , rBrace  , ignorable star end.
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> inLine [
	^ ('IN' asPParser , #word asPParser not , pinName , (comma , pinName) star , semi) trim: ignorable.
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> outLine [
	^ ('OUT' asPParser , #word asPParser not , pinName , (comma , pinName) star , semi) trim: ignorable.
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> part [
	^ chipName , lParen , pinAssignment , (comma, pinAssignment) star , rParen , semi
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> parts [
	^ ignorable star , 'PARTS:' asPParser  , ignorable plus, part star
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinAssignment [
	^ pinName , $= asPParser , pinName
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> pinName [
	^ (#letter asPParser , #word asPParser star) flatten trim: ignorable 
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> start [
	^ hdlFile
]
