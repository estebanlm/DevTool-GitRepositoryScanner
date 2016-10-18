accessing
addRepository: aReference ifAlreadyPresent: aBlock 
	"Adds a repository. GitFileTree if it finds it. Plain filetree if not."
	self isIcebergPresent 
		ifTrue: [ ^ self addIcebergRepository: aReference ifAlreadyPresent: aBlock ].
	^ self addDefaultRepository: aReference ifAlreadyPresent: aBlock