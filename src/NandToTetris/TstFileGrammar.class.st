Class {
	#name : #TstFileGrammar,
	#superclass : #NandFileGrammar,
	#instVars : [
		'period',
		'colon',
		'slash',
		'backSlash',
		'fileName',
		'comma',
		'semi',
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
		'varValue'
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
TstFileGrammar >> comma [
	^ $, asPParser
]

{ #category : #grammar }
TstFileGrammar >> compareToCommand [
	^ 'compare-to' asPParser , ignorable , fileName , '.cmp' asPParser
]

{ #category : #grammar }
TstFileGrammar >> evalcommand [
	^ 'eval' asPParser
]

{ #category : #grammar }
TstFileGrammar >> fileName [
	^ (period / colon / slash / backSlash / ignorable) negate plus
]

{ #category : #grammar }
TstFileGrammar >> loadCommand [
	^ 'load' asPParser , ignorable , fileName , '.hdl' asPParser
]

{ #category : #grammar }
TstFileGrammar >> outputCommand [
	^ 'output' asPParser
]

{ #category : #grammar }
TstFileGrammar >> outputFileCommand [
	^ 'output-file' asPParser , ignorable , fileName , '.out' asPParser
]

{ #category : #grammar }
TstFileGrammar >> outputListCommand [
	^ 'output-list' asPParser , (ignorable , varName) plus
]

{ #category : #grammar }
TstFileGrammar >> period [
	^ $. asPParser
]

{ #category : #grammar }
TstFileGrammar >> scriptCommand [
	^ loadCommand / outputFileCommand / outputListCommand / compareToCommand
		/ setCommand / evalcommand / outputCommand / tickCommand / tockCommand
		trim: ignorable
]

{ #category : #grammar }
TstFileGrammar >> semi [
	^ $; asPParser
]

{ #category : #grammar }
TstFileGrammar >> setCommand [
	^ 'set' asPParser , (ignorable , varName) , (ignorable , varValue)
]

{ #category : #grammar }
TstFileGrammar >> simulationStep [
	^ scriptCommand , (comma , scriptCommand) star , semi
	==> [:node | |result| result := LinkedList new. result add: node first. result addAll: (node second collect: [:n | n second]). result]
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
	^ (simulationStep star trim: ignorable) end
]

{ #category : #grammar }
TstFileGrammar >> varName [
	^ #letter asPParser , (#letter asPParser / #digit asPParser) star
		, '[]' asPParser optional
]

{ #category : #grammar }
TstFileGrammar >> varValue [
	^ (ignorable / terminator) negate plus
]
