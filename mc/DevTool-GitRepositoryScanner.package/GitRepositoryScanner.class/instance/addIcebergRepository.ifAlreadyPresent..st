private adding
addIcebergRepository: aReference ifAlreadyPresent: aBlock
	| repositoryClass repository gitReference |
	
	repositoryClass := Smalltalk classNamed: #IceRepository.
 	gitReference := self detectGitDirectoryOn: aReference.
	repositoryClass registry 
		detect: [ :repo | repo location = gitReference  ]
		ifFound: [ :repo | ^ aBlock value: repo ].
		
	repository := repositoryClass location: gitReference.
	gitReference = aReference ifFalse: [ 
		repository subdirectory: aReference basename ].
	^ repository register