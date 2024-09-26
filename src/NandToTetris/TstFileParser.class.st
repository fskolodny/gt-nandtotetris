Class {
	#name : #TstFileParser,
	#superclass : #TstFileGrammar,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstFileParser >> compareToCommand [
	^ super compareToCommand
	==> [ :node | TstCompareToCommand for: node third and: node fourth].
]

{ #category : #'as yet unclassified' }
TstFileParser >> evalcommand [
	^ super evalcommand
	==> [:node | TstEvalCommand new]
]

{ #category : #'as yet unclassified' }
TstFileParser >> loadCommand [
	^ super loadCommand
	==> [ :node | TstLoadHdlCommand for: node third and: node fourth ]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputCommand [
	^ super outputCommand
	==> [:node | TstOutputCommand new]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputFileCommand [
	^ super outputFileCommand
	==> [ :node | TstOutputFileCommand for: node third and: node fourth]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputListCommand [
	^ super outputListCommand
	==> [:node | TstOutputListCommand for: node second]
]

{ #category : #'as yet unclassified' }
TstFileParser >> setCommand [
	^ super setCommand
	==> [:node | TstSetCommand var: node second second value: node third second]
]

{ #category : #'as yet unclassified' }
TstFileParser >> simulationStep [
	^ super simulationStep
	==> [:node | | result | result :=  LinkedList new. result add: node first. result addAll: (node second collect: [:n|n]). result asArray]
]

{ #category : #'as yet unclassified' }
TstFileParser >> tstFile [
	^ super tstFile
	==> [:node | TstFile for: node]
]
