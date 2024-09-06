Class {
	#name : #BaselineOfNandToTetris,
	#superclass : #BaselineOf,
	#category : #BaselineOfNandToTetris
}

{ #category : #baseline }
BaselineOfNandToTetris >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'NandToTetris'.
			spec package: 'NandToTetris'
		]
]
