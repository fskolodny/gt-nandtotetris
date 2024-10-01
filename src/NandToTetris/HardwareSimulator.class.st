Class {
	#name : #HardwareSimulator,
	#superclass : #Object,
	#instVars : [
		'tstFile',
		'cmpFile',
		'outFile',
		'hdlFile',
		'parsedTstFile'
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
	file := FileSystem workingDirectory parent / aFileName.
	file exists ifTrue: [cmpFile := file contents]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> hdlFile [
	^ hdlFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> hdlFile: aFileName [
	| file |
	file := (FileSystem workingDirectory parent / aFileName) exists
			ifTrue: [ FileSystem workingDirectory parent / aFileName ]
			ifFalse: [ FileSystem workingDirectory parent / 'builtin' / aFileName ].
	hdlFile := file exists ifTrue: [ HdlFileParser new parse:file contents ] ifFalse: [ nil ]
]

{ #category : #accessing }
HardwareSimulator >> parsedTstFile [
	^ parsedTstFile
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> tstFile [
	^ tstFile
]

{ #category : #acccessing }
HardwareSimulator >> tstFile: aFileName [
	|file|
	file := FileSystem workingDirectory parent / aFileName.
	file exists ifTrue: [tstFile := file contents].
	parsedTstFile := TstFileParser new parse: tstFile.
	parsedTstFile rawData do: [:step| step rawData do:[:command| command context: self]].
]
