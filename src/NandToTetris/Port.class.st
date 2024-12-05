Class {
	#name : #Port,
	#superclass : #Object,
	#instVars : [
		'val',
		'observers'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Port >> addObserver: anObserver [
	observers add: anObserver
]

{ #category : #'as yet unclassified' }
Port >> initialize [
	super initialize.
	observers := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Port >> removeObserver: anObserver [
	observers remove: anObserver
]

{ #category : #accessing }
Port >> val [
	^ val
]

{ #category : #accessing }
Port >> val: aValue [
	val := aValue.
	observers do: [ :anObserver | anObserver val: aValue ]
]
