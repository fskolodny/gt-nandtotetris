Class {
	#name : #HdlFileParser,
	#superclass : #HdlFileGrammar,
	#category : #NandToTetris
}

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
