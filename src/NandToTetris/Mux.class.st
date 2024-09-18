Class {
	#name : #Mux,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Mux >> eval [
]

{ #category : #'as yet unclassified' }
Mux >> initialize [
	super initialize.
	#(#a #b #sel) do:[:key | inputs at: key put: nil]. outputs at: #out put: nil.
]
