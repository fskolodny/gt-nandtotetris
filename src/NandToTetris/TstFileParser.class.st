Class {
	#name : #TstFileParser,
	#superclass : #TstFileGrammar,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstFileParser >> loadCommand [
	^ super loadCommand
	==> [:node | TstLoadCommand with: node third and: node fourth]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputFileCommand [
	^ super outputFileCommand
	==> [:node | TstOutputListCommand for: node second]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputListCommand [
	^ super outputListCommand
	==> [:node | TstOutputListCommand for: node second]
]

{ #category : #'as yet unclassified' }
TstFileParser >> simulationStep [
	^ super simulationStep
	==> [:node |
	|result|
	result := LinkedList new.
	result add: node first.
	node second do: [:n | result add: n].
	result]
]

{ #category : #'as yet unclassified' }
TstFileParser >> tstFile [
	^ super tstFile
	==> [:node | |result| result := LinkedList new. result add: node first. result addAll: (node second collect: [:n | n second]). result]
]
