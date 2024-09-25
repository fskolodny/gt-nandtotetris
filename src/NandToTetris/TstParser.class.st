Class {
	#name : #TstParser,
	#superclass : #NandFileParser,
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
TstParser >> backSlash [
	^ $\ asPParser
]

{ #category : #grammar }
TstParser >> bang [
	^ $! asPParser
]

{ #category : #grammar }
TstParser >> colon [
	^ $: asPParser
]

{ #category : #grammar }
TstParser >> comma [
	^ $, asPParser
]

{ #category : #grammar }
TstParser >> compareToCommand [
	^ 'compare-to' asPParser , ignorable , fileName , '.cmp' asPParser
]

{ #category : #grammar }
TstParser >> evalcommand [
	^ 'eval' asPParser
]

{ #category : #grammar }
TstParser >> fileName [
	^ (period / colon / slash / backSlash / ignorable) negate plus
]

{ #category : #grammar }
TstParser >> loadCommand [
	^ 'load' asPParser , ignorable , fileName , '.hdl' asPParser
]

{ #category : #grammar }
TstParser >> outputCommand [
	^ 'output' asPParser
]

{ #category : #grammar }
TstParser >> outputFileCommand [
	^ 'output-file' asPParser , ignorable , fileName , '.out' asPParser
]

{ #category : #grammar }
TstParser >> outputListCommand [
	^ 'output-list' asPParser , (ignorable , varName) plus
]

{ #category : #grammar }
TstParser >> period [
	^ $. asPParser
]

{ #category : #grammar }
TstParser >> scriptCommand [
	^ loadCommand / outputFileCommand / outputListCommand / compareToCommand
		/ setCommand / evalcommand / outputCommand / tickCommand / tockCommand
		trim: ignorable
]

{ #category : #grammar }
TstParser >> semi [
	^ $; asPParser
]

{ #category : #grammar }
TstParser >> setCommand [
	^ 'set' asPParser , (ignorable , varName) , (ignorable , varValue)
]

{ #category : #grammar }
TstParser >> simulationStep [
	^ scriptCommand , (comma , scriptCommand) star , semi
]

{ #category : #grammar }
TstParser >> slash [
	^ $/ asPParser
]

{ #category : #accessing }
TstParser >> start [
	^ tstFile
]

{ #category : #grammar }
TstParser >> terminator [
	^ (comma / semi / bang) asPParser
]

{ #category : #grammar }
TstParser >> tickCommand [
	^ 'tick' asPParser
]

{ #category : #grammar }
TstParser >> tockCommand [
	^ 'tock' asPParser
]

{ #category : #grammar }
TstParser >> tstFile [
	^ (simulationStep star trim: ignorable) end
]

{ #category : #grammar }
TstParser >> varName [
	^ #letter asPParser , (#letter asPParser / #digit asPParser) star
		, '[]' asPParser optional
]

{ #category : #grammar }
TstParser >> varValue [
	^ (ignorable / terminator) negate plus
]
