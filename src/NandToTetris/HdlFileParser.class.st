Class {
	#name : #HdlFileParser,
	#superclass : #HdlFileGrammar,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HdlFileParser >> hdlFile [
	^ super hdlFile
		==> [ :node | 
			| result |
			node fourth first = 'BUILTIN'
				ifTrue: [ result := node second second asSymbol asClass new ]
				ifFalse: [ result := CompositeChip new.
					node second third do: [ :name | result inputs at: name asSymbol put: nil].
					node third third do: [ :name | result outputs at: name asSymbol put: nil].
					result parts: node fourth second.
					].
			result ]
]

{ #category : #'as yet unclassified' }
HdlFileParser >> pinAssignments [
	^ super pinAssignments
	==> [ :node |
	| result |
	result := OrderedCollection new.
	result add: node first.
	result addAll: node second.
	result]
]

{ #category : #'as yet unclassified' }
HdlFileParser >> pinNames [
	^ super pinNames
	==> [ :node |
	| result |
	result := OrderedCollection new.
	result add: node first.
	result addAll: node second.
	result]
]
