Class {
	#name : #NandFileGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'eolComment',
		'endOfComment',
		'apiComment',
		'regularComment',
		'space',
		'ignorable'
	],
	#category : #NandToTetris
}

{ #category : #grammar }
NandFileGrammar >> apiComment [
	^ '/**' asPParser , endOfComment negate star , endOfComment
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

{ #category : #grammar }
NandFileGrammar >> regularComment [
	^ '/*' asPParser , endOfComment negate star , endOfComment
]

{ #category : #grammar }
NandFileGrammar >> space [
	^ #space asPParser
]

{ #category : #accessing }
NandFileGrammar >> start [
	^ ignorable
]
