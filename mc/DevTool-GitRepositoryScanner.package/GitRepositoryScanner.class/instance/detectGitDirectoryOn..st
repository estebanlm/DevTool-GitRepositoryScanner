private adding
detectGitDirectoryOn: aReference
	aReference ifNil: [ self error: 'Not a git repository!' ].
	(aReference / '.git') exists 
		ifFalse: [ ^ self detectGitDirectoryOn: aReference parent ].
	^ aReference