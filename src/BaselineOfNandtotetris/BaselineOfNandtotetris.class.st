Class {
	#name : #BaselineOfNandToTetris,
	#superclass : #BaselineOf,
	#category : #BaselineOfNandToTetris
}

{ #category : #loading }
BaselineOfNandToTetris class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-nandtotetris' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfNandToTetris >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'NandToTetris'
		]
]
