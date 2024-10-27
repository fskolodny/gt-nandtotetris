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
									| localWire globalWire partInputs |
									localWire := assignment first.
									globalWire := assignment second.
									partInputs := chipPart first inputs.
									(partInputs includesKey: localWire)
										ifTrue: [ partInputs
												at: localWire
												put: [ (result inputs at: globalWire) value ] ]
										ifFalse: [ result outputs
												at: globalWire
												put: [ (chipPart first outputs at: localWire) value ] ] ] ].
					result parts: (node fourth second collect: [:p | p first]) asArray].
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
			OrderedCollection new
				add: node first;
				addAll: node second;
				yourself ]
]

{ #category : #'as yet unclassified' }
HdlFileParser >> pinNames [
	^ super pinNames
		==> [ :node | 
			OrderedCollection new
				add: node first;
				addAll: node second;
				yourself ]
]
