Class {
	#name : #HardwareSimulator,
	#superclass : #Object,
	#instVars : [
		'tstFile',
		'cmpFile',
		'outFile',
		'hdlFile',
		'parsedTstFile',
		'directory',
		'outputList'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HardwareSimulator >> cmpFile [
	^ cmpFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> cmpFile: aFileName [
	|file|
	file := directory / aFileName.
	file exists ifTrue: [cmpFile := file contents]
]

{ #category : #accessing }
HardwareSimulator >> directory [
	^ directory
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> hdlFile [
	^ hdlFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> hdlFile: aFileName [
	| file |
	file := (directory / aFileName) exists
			ifTrue: [ directory / aFileName ]
			ifFalse: [ directory / 'builtin' / aFileName ].
	hdlFile := file exists ifTrue: [ HdlFileParser new parse:file contents ] ifFalse: [ nil ]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> initialize [
	super initialize.
	directory := FileSystem workingDirectory parent.
]

{ #category : #accessing }
HardwareSimulator >> outFile [
	^ outFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> outputFile: aFileName [
	outFile := (directory / aFileName) writeStream.
]

{ #category : #accessing }
HardwareSimulator >> outputList [
	^ outputList
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> outputList: aCollection [
	outputList := aCollection
]

{ #category : #accessing }
HardwareSimulator >> outputVars [
	^ outputVars
]

{ #category : #accessing }
HardwareSimulator >> parsedTstFile [
	^ parsedTstFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> set: var to: aValue [
	hdlFile inputs at: var asSymbol put: [aValue].
]

{ #category : #acccessing }
HardwareSimulator >> setCommandContexts [
	parsedTstFile rawData do: [:step | step rawData do: [:command | command context: self]]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> tstFile [
	^ tstFile
]

{ #category : #acccessing }
HardwareSimulator >> tstFile: aFileName [
	| file |
	file := directory / aFileName.
	file exists
		ifTrue: [ tstFile := file contents.
			parsedTstFile := TstFileParser new parse: tstFile.
			self setCommandContexts ]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> valueAt: var [
	|sym|
	sym := var asSymbol.
	^((hdlFile inputs keys includes: sym) ifTrue: [hdlFile inputs at: sym] ifFalse: [hdlFile outputs at: sym]) value
]
