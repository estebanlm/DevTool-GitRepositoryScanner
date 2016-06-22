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

	repository morphicOpen	
