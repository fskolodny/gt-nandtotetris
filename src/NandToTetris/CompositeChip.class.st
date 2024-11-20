Class {
	#name : #CompositeChip,
	#superclass : #Chip,
	#instVars : [
		'parts',
		'internalPins',
		'evalBlocks'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
CompositeChip >> eval [
	evalBlocks do: [:aBlock | aBlock value].
]

{ #category : #accessing }
CompositeChip >> evalBlocks [
	^ evalBlocks
]

{ #category : #'as yet unclassified' }
CompositeChip >> initialize [
	super initialize.
	parts := OrderedCollection new.
	internalPins := IdentityDictionary new.
	evalBlocks := OrderedCollection new.
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
