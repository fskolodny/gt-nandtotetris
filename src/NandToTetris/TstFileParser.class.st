Class {
	#name : #TstFileParser,
	#superclass : #TstFileGrammar,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstFileParser >> compareToCommand [
	^ super compareToCommand
	==> [ :node | TstCompareToCommand for: node third].
]

{ #category : #'as yet unclassified' }
TstFileParser >> evalcommand [
	^ super evalcommand
	==> [:node | TstEvalCommand new]
]

{ #category : #'as yet unclassified' }
TstFileParser >> loadCommand [
	^ super loadCommand
	==> [ :node | TstLoadHdlCommand for: node third ]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputCommand [
	^ super outputCommand
	==> [:node | TstOutputCommand new]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputFileCommand [
	^ super outputFileCommand
	==> [ :node | TstOutputFileCommand for: node third ]
]

{ #category : #'as yet unclassified' }
TstFileParser >> outputListCommand [
	^ super outputListCommand
	==> [:node | TstOutputListCommand for: node second]
]

{ #category : #'as yet unclassified' }
TstFileParser >> setCommand [
	^ super setCommand
		==> [ :node | 
			TstSetCommand
				var: node second second
				value: (Integer
						readFrom: node third second second readStream
						radix: (node third second first = #decimal
								ifTrue: [ 10 ]
								ifFalse: [ node third first = #hex ifTrue: [ 16 ] ifFalse: [ 2 ] ])) ]
]

{ #category : #'as yet unclassified' }
TstFileParser >> simulationStep [
	^ super simulationStep
	==> [:node |TstSimulationStep new rawData: node]
]

{ #category : #'as yet unclassified' }
TstFileParser >> tickCommand [
	^ super tickCommand
	==> [:node|TstTickCommand new]
]

{ #category : #'as yet unclassified' }
TstFileParser >> tockCommand [
	^ super tockCommand
	==> [:node|TstTockCommand new]
]

{ #category : #'as yet unclassified' }
TstFileParser >> tstFile [
	^ super tstFile
	==> [:node | TstFile for: node asArray]
]
