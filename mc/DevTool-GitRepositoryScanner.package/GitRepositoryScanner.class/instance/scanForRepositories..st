private
scanForRepositories: aDirectory 
	^ (aDirectory directories
		select: [ :each | (each / '.git') exists ]
		thenCollect: [ :each | self scanForFileTree: each ]) 
		reject: #isNil
		