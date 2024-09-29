Class {
	#name : #TstSimulationStep,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
TstSimulationStep >> executeAll [
	rawData do: [ :command | command execute ]
]

{ #category : #accessing }
TstSimulationStep >> rawData [
	^ rawData
]

{ #category : #'as yet unclassified' }
TstSimulationStep >> rawData: anObject [
	rawData := anObject
]
