private adding
addDefaultRepository: aReference ifAlreadyPresent: aBlock	| repositoryClass repository |
	repositoryClass := #MCFileTreeGitRepository asClassIfAbsent: [ MCFileTreeRepository ].
	repository := repositoryClass new directory: aReference.
	(MCRepositoryGroup default includes: repository)
		ifTrue: [ aBlock value: repository ]
		ifFalse: [ MCRepositoryGroup default addRepository: repository ].
	^ repository