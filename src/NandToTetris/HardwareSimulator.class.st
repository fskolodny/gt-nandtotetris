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
		'outputLineNumber',
		'gateDictionary'
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
	hdlFile := self parseHdlFile: aFileName.
	^ hdlFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> initialize [
	super initialize.
	directory := FileSystem workingDirectory parent.
	gateDictionary := IdentityDictionary new.
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

{ #category : #'as yet unclassified' }
HardwareSimulator >> parseHdlFile: aFileName [
	| anAssociation aKey |
	aKey := aFileName asSymbol.
	anAssociation := gateDictionary associationAt: aKey ifAbsent: [ nil ].
	anAssociation
		ifNil: [ gateDictionary
				at: aKey
				put: (HdlFileParser new
						context: self;
						parse: ((directory / aFileName) exists
								ifTrue: [ directory / aFileName ]
								ifFalse: [ directory / 'builtin' / aFileName ]) asFileReference contents).
			anAssociation := gateDictionary associationAt: aKey ].
	^ anAssociation value clone
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
