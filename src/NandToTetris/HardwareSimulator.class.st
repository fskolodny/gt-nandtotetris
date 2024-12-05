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
		'outputList',
		'outputLineNumber'
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
	file exists ifTrue: [cmpFile := file contents lines]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> compareLine: aLine [
	outputLineNumber := outputLineNumber + 1.
	self assert: aLine equals: (cmpFile at: outputLineNumber)
]

{ #category : #accessing }
HardwareSimulator >> directory [
	^ directory
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> executeTstFile [
	parsedTstFile rawData do: [:step | step executeAll].
	outFile flush; close.
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
	hdlFile := HdlFileParser new parse: file contents
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
	outFile := (directory / aFileName) delete; writeStream.
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
HardwareSimulator >> parsedTstFile [
	^ parsedTstFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> set: var to: aValue [
	(hdlFile pins at: var asSymbol) val: ({false.true} at:aValue + 1)
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
			self setCommandContexts .
			outputLineNumber := 0]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> valueAt: var [
	|sym|
	sym := var asSymbol.
	^(hdlFile pins at: sym) val
]
