Class {
	#name : #NandGate,
	#superclass : #Gate,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
NandGate >> a: aBit [
	(pins at: #a) val: aBit.
]

{ #category : #'as yet unclassified' }
NandGate >> b: aBit [
	(pins at: #b) val: aBit.
]

{ #category : #'as yet unclassified' }
NandGate >> eval [
	(pins at: #out) val: ((pins at: #a) val and: (pins at: #b) val) not
]

{ #category : #'as yet unclassified' }
NandGate >> initialize [
	super initialize.
	pins := IdentityDictionary new.
	{#a . #b . #out} do: [ :aName | pins at: aName put: Port new].
]

{ #category : #'as yet unclassified' }
NandGate >> out [
	^ (pins at: #out) val
]
