Class {
	#name : #BaselineOfNandtotetris,
	#superclass : #BaselineOf,
	#category : #BaselineOfNandtotetris
}

{ #category : #loading }
BaselineOfNandtotetris class >> loadLepiter [
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
BaselineOfNandtotetris >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Nandtotetris'
		]
]
