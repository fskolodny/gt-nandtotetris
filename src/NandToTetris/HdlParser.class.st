Class {
	#name : #HdlParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'hdlFile',
		'eolComment'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HdlParser >> eolComment [
	eolComment := '//' asPParser, #newline asPParser  negate star asPParser , #newline asPParser.
	^ eolComment
]

{ #category : #'as yet unclassified' }
HdlParser >> start [
	^ hdlFile.
]
