Class {
	#name : #NandFileGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'eolComment',
		'endOfComment',
		'apiComment',
		'regularComment',
		'space',
		'ignorable',
		'lBrace',
		'rBrace',
		'comma',
		'semi',
		'rParen',
		'lParen'
	],
	#category : #NandToTetris
}

{ #category : #grammar }
NandFileGrammar >> apiComment [
	^ '/**' asPParser , endOfComment negate star , endOfComment
]

{ #category : #grammar }
NandFileGrammar >> comma [
	^ $, asPParser
]

{ #category : #grammar }
NandFileGrammar >> endOfComment [
	^ '*/' asPParser
]

{ #category : #grammar }
NandFileGrammar >> eolComment [
	^ '//' asPParser , #newline asPParser negate star asPParser
		, #newline asPParser
]

{ #category : #grammar }
NandFileGrammar >> ignorable [
	^ (apiComment / regularComment / eolComment / space) plus
]

{ #category : #'as yet unclassified' }
NandFileGrammar >> lBrace [
	^ ${ asPParser
]

{ #category : #'as yet unclassified' }
NandFileGrammar >> lParen [
	^ $( asPParser
]

{ #category : #'as yet unclassified' }
NandFileGrammar >> rBrace [
	^ $} asPParser
]

{ #category : #'as yet unclassified' }
NandFileGrammar >> rParen [
	^ $) asPParser
]

{ #category : #grammar }
NandFileGrammar >> regularComment [
	^ '/*' asPParser , endOfComment negate star , endOfComment
]

{ #category : #grammar }
NandFileGrammar >> semi [
	^ $; asPParser
]

{ #category : #grammar }
NandFileGrammar >> space [
	^ #space asPParser
]

{ #category : #accessing }
NandFileGrammar >> start [
	^ ignorable
]
