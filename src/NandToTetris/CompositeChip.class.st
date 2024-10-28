Class {
	#name : #CompositeChip,
	#superclass : #Chip,
	#instVars : [
		'parts',
		'internalPins'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
CompositeChip >> eval [
	parts do: [:part | part eval].
]

{ #category : #'as yet unclassified' }
CompositeChip >> initialize [
	super initialize.
	parts := OrderedCollection new.
	internalPins := IdentityDictionary new.
]

{ #category : #accessing }
CompositeChip >> internalPins [
	^ internalPins
]

{ #category : #'as yet unclassified' }
CompositeChip >> isClocked [
	parts detect: [:part | part isClocked] ifFound: [^ true] ifNone: [^ false]
]

{ #category : #accessing }
CompositeChip >> parts [
	^ parts
]

{ #category : #accessing }
CompositeChip >> parts: anObject [
	parts := anObject
]
