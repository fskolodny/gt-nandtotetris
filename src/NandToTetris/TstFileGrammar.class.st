Class {
	#name : #TstFileGrammar,
	#superclass : #NandFileGrammar,
	#instVars : [
		'period',
		'colon',
		'slash',
		'backSlash',
		'fileName',
		'bang',
		'varName',
		'terminator',
		'loadCommand',
		'outputFileCommand',
		'compareToCommand',
		'outputListCommand',
		'setCommand',
		'evalcommand',
		'outputCommand',
		'tickCommand',
		'tockCommand',
		'scriptCommand',
		'simulationStep',
		'tstFile',
		'varValue',
		'format'
	],
	#category : #NandToTetris
}

{ #category : #grammar }
TstFileGrammar >> backSlash [
	^ $\ asPParser
]

{ #category : #grammar }
TstFileGrammar >> bang [
	^ $! asPParser
]

{ #category : #grammar }
TstFileGrammar >> colon [
	^ $: asPParser
]

{ #category : #grammar }
TstFileGrammar >> compareToCommand [
	^ 'compare-to' asPParser , ignorable , fileName
]

{ #category : #grammar }
TstFileGrammar >> evalcommand [
	^ 'eval' asPParser
]

{ #category : #grammar }
TstFileGrammar >> fileName [
	^ (#letter asPParser , (#word asPParser / $_ asPParser / period) star) flatten
]

{ #category : #'as yet unclassified' }
TstFileGrammar >> format [
	^ $% asPParser , ( $B asPParser ) , number , period , number , period , number 
]

{ #category : #grammar }
TstFileGrammar >> loadCommand [
	^ 'load' asPParser , ignorable , fileName, ignorable star
]

{ #category : #grammar }
TstFileGrammar >> outputCommand [
	^ 'output' asPParser
]

{ #category : #grammar }
TstFileGrammar >> outputFileCommand [
	^ 'output-file' asPParser , ignorable , fileName
]

{ #category : #grammar }
TstFileGrammar >> outputListCommand [
	^ 'output-list' asPParser , (ignorable , varName , format optional) plus
]

{ #category : #grammar }
TstFileGrammar >> period [
	^ $. asPParser
]

{ #category : #grammar }
TstFileGrammar >> scriptCommand [
	^ (loadCommand / outputFileCommand / outputListCommand / compareToCommand
		/ setCommand / evalcommand / outputCommand / tickCommand / tockCommand)
		trim: ignorable
]

{ #category : #grammar }
TstFileGrammar >> setCommand [
	^ 'set' asPParser , (ignorable , varName) , (ignorable , varValue)
]

{ #category : #grammar }
TstFileGrammar >> simulationStep [
	^ scriptCommand , ((comma , scriptCommand) ==> [:node | node second]) star , semi
	==> [ :node | | result | result := OrderedCollection new. result add: node first; addAll: node second. result asArray]
]

{ #category : #grammar }
TstFileGrammar >> slash [
	^ $/ asPParser
]

{ #category : #accessing }
TstFileGrammar >> start [
	^ tstFile
]

{ #category : #grammar }
TstFileGrammar >> terminator [
	^ (comma / semi / bang) asPParser
]

{ #category : #grammar }
TstFileGrammar >> tickCommand [
	^ 'tick' asPParser
]

{ #category : #grammar }
TstFileGrammar >> tockCommand [
	^ 'tock' asPParser
]

{ #category : #grammar }
TstFileGrammar >> tstFile [
	^ (simulationStep plus) trim: ignorable 
]

{ #category : #grammar }
TstFileGrammar >> varName [
	^ (#letter asPParser , #word asPParser star
		, '[]' asPParser optional) flatten
]

{ #category : #grammar }
TstFileGrammar >> varValue [
	^ ($% asPParser , ($b asPParser / $B asPParser / $d asPParser / $D asPParser / $x asPParser / $X asPParser)) optional , number
	==> [ :node | node at:1 put: (node first isNil ifTrue: [#decimal] ifFalse: [|f| f:= node first second asUppercase. f = $D ifTrue: [#decimal] ifFalse: [f = $B ifTrue: [#binary] ifFalse: [#hex]]]). node ]
]
