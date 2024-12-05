Class {
	#name : #Wire,
	#superclass : #Connector,
	#category : #NandToTetris
}

{ #category : #'as yet unclassified' }
Wire >> initialize [
	super initialize.
	val := false.
]

{ #category : #accessing }
Wire >> val: aBoolean [
	destinations do: [ :aDestination | aDestination val: aBoolean ].
]
