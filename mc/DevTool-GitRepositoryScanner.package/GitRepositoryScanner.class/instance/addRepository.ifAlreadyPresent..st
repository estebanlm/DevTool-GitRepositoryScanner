accessing
addRepository: aReference ifAlreadyPresent: aBlock 
	"Adds a repository. GitFileTree if it finds it. Plain filetree if not."
	| repositoryClass repository |
	
	repositoryClass := #MCFileTreeGitRepository asClassIfAbsent: [ MCFileTreeRepository ].
	repository := repositoryClass new directory: aReference.
	(MCRepositoryGroup default includes: repository)
		ifTrue: [ aBlock value: repository ]
		ifFalse: [ MCRepositoryGroup default addRepository: repository ].
	^ repository