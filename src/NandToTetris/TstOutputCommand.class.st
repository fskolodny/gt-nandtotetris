Class {
	#name : #TstOutputCommand,
	#superclass : #TstCommand,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstOutputCommand >> execute [
	| line |
	line := context outputList printVars: #value.
	context compareLine: line.
]
