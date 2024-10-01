Class {
	#name : #TstLoadHdlCommand,
	#superclass : #TstFileCommand,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstLoadHdlCommand >> execute [
	context hdlFile: fileName
]
