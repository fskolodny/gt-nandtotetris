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
	parts
		do: [ :aChip | 
			| anAssociation |
			anAssociation := aChip dictionary associationAt: #blocks ifAbsent: nil.
			anAssociation
				ifNil: [ aChip eval ]
				ifNotNil: [ anAssociation value first do: [ :aBlock | aBlock value ].
					aChip eval.
					anAssociation value second do: [ :aBlock | aBlock value ] ] ]
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
