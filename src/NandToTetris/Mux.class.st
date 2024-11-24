Class {
	#name : #Mux,
	#superclass : #Chip,
	#category : #NandToTetris
}

{ #category : #accessing }
Mux >> a: anInteger [ 
	inputs at: #a put: anInteger
]

{ #category : #accessing }
Mux >> b: anInteger [ 
	inputs at: #b put: anInteger
]

{ #category : #'as yet unclassified' }
Mux >> eval [
	outputs at: #out put: ((inputs at: #sel) = 0 ifTrue: [inputs at: #a] ifFalse: [inputs at: #b])
]

{ #category : #'as yet unclassified' }
Mux >> initialize [
	super initialize.
	#(#a #b #sel) do:[:key | inputs at: key put: nil]. outputs at: #out put: nil.
]

{ #category : #accessing }
Mux >> out [
	^ outputs at: #out
]

{ #category : #accessing }
Mux >> sel: anInteger [
	inputs at: #sel put: anInteger
]
