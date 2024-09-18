Class {
	#name : #HardwareSimulator,
	#superclass : #Object,
	#instVars : [
		'testFile',
		'cmpFile',
		'outFile',
		'hdlFile'
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
	hdlFile := file exists ifTrue: [ file contents ] ifFalse: [ nil ]
]

{ #category : #'as yet unclassified' }
HardwareSimulator >> testFile [
	^ testFile
]

{ #category : #acccessing }
HardwareSimulator >> testFile: aFileName [
	|file|
	file := FileSystem workingDirectory parent / aFileName.
	file exists ifTrue: [testFile := file contents]
]
