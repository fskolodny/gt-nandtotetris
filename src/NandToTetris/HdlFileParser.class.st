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
					node second third
						do: [ :wireName | 
							| unsubscriptedWireName |
							unsubscriptedWireName := wireName isArray
									ifTrue: [ wireName first ]
									ifFalse: [ wireName ].
							result inputs at: unsubscriptedWireName asSymbol put: nil ].
					node third third
						do: [ :wireName | 
							| unsubscriptedWireName |
							unsubscriptedWireName := wireName isArray
									ifTrue: [ wireName first ]
									ifFalse: [ wireName ].
							result outputs at: unsubscriptedWireName asSymbol put: nil ].
					node fourth second
						do: [ :chipPart | 
							| aChip beforeBlocks afterBlocks |
							aChip := chipPart first.
							beforeBlocks := OrderedCollection new.
							afterBlocks := OrderedCollection new.
							chipPart second
								do: [ :assignment | 
									| localWire globalWire partInputs partOutputs unsubscriptedWireName |
									localWire := assignment first.
									globalWire := assignment second.
									unsubscriptedWireName := globalWire isArray
											ifTrue: [ globalWire first ]
											ifFalse: [ globalWire ].
									partOutputs := aChip outputs.
									partInputs := aChip inputs.
									(partInputs includesKey: localWire)
										ifTrue: [ beforeBlocks
												add: [ partInputs
														at: localWire
														put: [ (((result inputs includesKey: unsubscriptedWireName)
																ifTrue: [ result inputs ]
																ifFalse: [ result internalPins ]) at: unsubscriptedWireName)
																value ] ] ]
										ifFalse: [ afterBlocks
												add: [ ((result outputs includesKey: unsubscriptedWireName)
														ifTrue: [ result outputs ]
														ifFalse: [ result internalPins ])
														at: unsubscriptedWireName
														put: [ (partOutputs at: localWire) value ] ] ] ].
							result evalBlocks
								addAll: beforeBlocks;
								add: [ aChip eval ];
								addAll: afterBlocks ].
					result parts: (node fourth second collect: [ :p | p first ]) asArray ].
			result ]
]

{ #category : #'as yet unclassified' }
HdlFileParser >> part [
	^ super part
		==> [ :node | 
			| sim |
			sim := HardwareSimulator new.
			sim hdlFile: node first, '.hdl'.
			node at:1 put: (HardwareSimulator new hdlFile: node first, '.hdl'; hdlFile).
			node ]
]
