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
							| aChip |
							aChip := chipPart first.
							chipPart second
								do: [ :assignment | 
									| localWire globalWire partInputs partOutputs |
									localWire := assignment first.
									globalWire := assignment second.
									partOutputs := aChip outputs.
									partInputs := aChip inputs.
									(partInputs includesKey: localWire)
										ifTrue: [ partInputs at: localWire put: [ (((result inputs includesKey: globalWire) ifTrue:[result inputs] ifFalse: [result internalPins]) at: globalWire) value ] ]
										ifFalse: [ ((result outputs includesKey: globalWire) ifTrue:[result outputs] ifFalse: [result internalPins])
												at: globalWire
												put: [ 
													(partOutputs at: localWire) value ] ] ] ].
					result parts: (node fourth second collect: [ :p | p first ]) asArray ].
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
