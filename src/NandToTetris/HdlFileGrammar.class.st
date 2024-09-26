Class {
	#name : #HdlFileGrammar,
	#superclass : #NandFileGrammar,
	#instVars : [
		'inLine',
		'outLine',
		'hdlFile',
		'pinName',
		'chipName'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HdlFileGrammar >> chipName [
	^ pinName
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> hdlFile [
	^ ignorable star , 'CHIP' asPParser , ignorable plus , chipName, lBrace , inLine, outLine , ignorable star , 'PARTS:' asPParser  , ignorable star , rBrace  , ignorable star end.
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
HdlFileGrammar >> pinName [
	^ (#letter asPParser , #word asPParser star) flatten trim: ignorable 
]

{ #category : #'as yet unclassified' }
HdlFileGrammar >> start [
	^ hdlFile
]
