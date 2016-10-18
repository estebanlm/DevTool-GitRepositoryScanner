execute
execute
	| repository |

	repository := self scanner 
		addRepository: self reference
		ifAlreadyPresent: [ :aRepository | ].
	repository ifNil: [ ^ self ].

	self scanForBaseline
		ifNotNil: [ :aReference | 
			(self confirm: ('{1} is there, should I install it?' format: { aReference base }))						
				ifTrue: [ ^ self installBaseline: aReference repository: repository ] ].

	"All this uglyness is because Iceberg is still not in the image and I don't know if 
	 is present at all"
	(repository isKindOf: MCRepository) 
		ifTrue: [ ^ repository morphicOpen ].	
	(repository isKindOf: (Smalltalk classNamed: #IceRepository))
		ifTrue: [ ^ (Smalltalk classNamed: #IceSynchronizer) new repository: repository; openWithSpec ].
	self error: 'Repository kind not understood.'