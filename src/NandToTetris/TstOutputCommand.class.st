Class {
	#name : #TstOutputCommand,
	#superclass : #TstCommand,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstOutputCommand >> execute [
	context outputList printVars: #value
]
