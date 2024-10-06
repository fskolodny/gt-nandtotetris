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
				ifTrue: [ result := node fourth second asSymbol asClass new ]
				ifFalse: [ result := CompositeChip new.
					node second third do: [ :name | result inputs at: name asSymbol put: nil ].
					node third third do: [ :name | result outputs at: name asSymbol put: nil ].
					node fourth second
						do: [ :chipPart | 
							chipPart second
								do: [ :assignment | 
									| key partInputs |
									key := assignment first asSymbol.
									partInputs := chipPart first inputs.
									(partInputs includesKey: key)
										ifTrue: [ partInputs
												at: key
												put: [ (result inputs at: assignment second asSymbol) value ] ]
										ifFalse: [ result outputs
												at: assignment second asSymbol
												put: [ (chipPart first outputs at: key) value ] ] ] ].
					result parts: (node fourth second collect: [:p | p first])].
			result ]
]

{ #category : #'as yet unclassified' }
HdlFileParser >> part [
	
	^ super part
		==> [ :node | 
			| sim chip result|
			sim := HardwareSimulator new.
			sim hdlFile: node first , '.hdl'.
			chip := sim hdlFile.
			result := {chip . node second}.
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
