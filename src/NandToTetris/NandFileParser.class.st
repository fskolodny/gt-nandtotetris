Class {
	#name : #NandFileParser,
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
NandFileParser >> apiComment [
	^ '/**' asPParser , endOfComment negate star , endOfComment
]

{ #category : #grammar }
NandFileParser >> endOfComment [
	^ '*/' asPParser
]

{ #category : #grammar }
NandFileParser >> eolComment [
	^ '//' asPParser , #newline asPParser negate star asPParser
		, #newline asPParser
]

{ #category : #grammar }
NandFileParser >> ignorable [
	^ (apiComment / regularComment / eolComment / space) plus
]

{ #category : #grammar }
NandFileParser >> regularComment [
	^ '/*' asPParser , endOfComment negate star , endOfComment
]

{ #category : #grammar }
NandFileParser >> space [
	^ #space asPParser
]

{ #category : #accessing }
NandFileParser >> start [
	^ ignorable
]
