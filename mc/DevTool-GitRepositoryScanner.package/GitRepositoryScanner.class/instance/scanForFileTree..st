private
scanForFileTree: aDirectory 
	"scan for directories containing .filetree to detect them. 
	 Just one level and not recursive because with filetree format, we are dealing with a lot of "
	(aDirectory / '.filetree') exists ifTrue: [ ^ aDirectory ].	
	^ aDirectory directories 
		detect: [ :each | (each / '.filetree') exists ]
		ifNone: [ nil ]