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
				ifFalse: [ result := CompositeChip new ].
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
			node fourth first = 'BUILTIN'
				ifFalse: [ node fourth second
						do: [ :chipPart | 
							| aChip beforeBlocks afterBlocks |
							aChip := chipPart first.
							beforeBlocks := OrderedCollection new.
							afterBlocks := OrderedCollection new.
							chipPart second
								do: [ :assignment | 
									| localWire globalWire partInputs partOutputs unsubscriptedWireName globalAssoc localAssoc |
									localWire := assignment first asSymbol.
									globalWire := assignment second.
									unsubscriptedWireName := (globalWire isArray
											ifTrue: [ globalWire first ]
											ifFalse: [ globalWire ]) asSymbol.
									globalAssoc := ((result inputs includesKey: unsubscriptedWireName)
											ifTrue: [ result inputs ]
											ifFalse: [ (result outputs includesKey: unsubscriptedWireName)
													ifTrue: [ result outputs ]
													ifFalse: [ (result internalPins includesKey: unsubscriptedWireName) ifFalse: [result internalPins at: unsubscriptedWireName put: nil].
													result internalPins]])
											associationAt: unsubscriptedWireName.
									partOutputs := aChip outputs.
									partInputs := aChip inputs.
									(partInputs includesKey: localWire)
										ifTrue: [ localAssoc := partInputs associationAt: localWire.
											beforeBlocks
												add: (globalWire isArray
														ifFalse: [ [ localAssoc value: globalAssoc value ] ]
														ifTrue: [ [ localAssoc
																value: (globalAssoc value value bitAt: globalWire second asString asInteger + 1) ] ]) ]
										ifFalse: [ localAssoc := partOutputs associationAt: localWire.
											afterBlocks
												add: (globalWire isArray
														ifFalse: [ [ globalAssoc value: localAssoc value ] ]
														ifTrue: [ [ globalAssoc
																value: ((globalAssoc value isNil ifTrue: [ 0 ] ifFalse: [ globalAssoc value ])
																		bitAt: globalWire second asString asInteger + 1
																		put: localAssoc value) ] ]) ] ].
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
