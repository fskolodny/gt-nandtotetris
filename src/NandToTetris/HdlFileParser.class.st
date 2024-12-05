Class {
	#name : #HdlFileParser,
	#superclass : #HdlFileGrammar,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
HdlFileParser >> hdlFile [
	^ super hdlFile
		==> [ :node | 
			| result inputs outputs |
			inputs := OrderedCollection new.
			outputs := OrderedCollection new.
			node fourth first = 'BUILTIN'
				ifTrue: [ result := (node fourth second , 'Gate') asSymbol asClass new ]
				ifFalse: [ result := CompositeGate new ].
			node second third
				do: [ :wireName | 
					| unsubscriptedWireName |
					unsubscriptedWireName := wireName isArray
							ifTrue: [ wireName first ]
							ifFalse: [ wireName ].
					inputs add: unsubscriptedWireName asSymbol.
					result pins at: unsubscriptedWireName asSymbol put: Port new ].
			node third third
				do: [ :wireName | 
					| unsubscriptedWireName |
					unsubscriptedWireName := wireName isArray
							ifTrue: [ wireName first ]
							ifFalse: [ wireName ].
					outputs add: unsubscriptedWireName asSymbol.
					result pins at: unsubscriptedWireName asSymbol put: Port new ].
			result dictionary at: #inputs put: inputs; at: #outputs put: outputs.
			node fourth first = 'PARTS:'
				ifTrue: [ | wires |
				wires := IdentityDictionary new.
				result pins keysAndValuesDo: [ :aKey :aValue | wires at: aKey put: ((inputs includes: aKey) ifTrue: [Wire new source: aValue] ifFalse: [Wire new addDestination: aValue])  ].
				node fourth second
						do: [ :chipPart | 
							| aChip |
							aChip := chipPart first.
							chipPart second
								do: [ :assignment | 
									| localWire globalWire partInputs partOutputs unsubscriptedWireName |
									localWire := assignment first asSymbol.
									globalWire := assignment second.
									partOutputs := aChip dictionary at: #outputs.
									partInputs := aChip dictionary at: #inputs.
									unsubscriptedWireName := (globalWire isArray
											ifTrue: [ globalWire first ]
											ifFalse: [ globalWire ]) asSymbol.
									(wires includesKey: unsubscriptedWireName) ifFalse: [wires at: unsubscriptedWireName put: Wire new].
									(partInputs includes: localWire)
										ifTrue: [ (wires at: unsubscriptedWireName) addDestination: (aChip pins at: localWire). ]
										ifFalse: [ (wires at: unsubscriptedWireName) source: (aChip pins at: localWire). ]
										].
					result parts: (node fourth second collect: [ :p | p first ]) asArray ]].
			result ]
]

{ #category : #'as yet unclassified' }
HdlFileParser >> part [
	^ super part
		==> [ :node | 
			node at:1 put: (HardwareSimulator new hdlFile: node first, '.hdl'; hdlFile).
			node ]
]
