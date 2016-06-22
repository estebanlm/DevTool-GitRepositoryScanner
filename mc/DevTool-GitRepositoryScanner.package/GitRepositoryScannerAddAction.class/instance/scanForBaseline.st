private
scanForBaseline
	^ (self reference directoriesMatching: 'BaselineOf*.package')
		ifNotEmpty: [ :dir | dir first ]
		ifEmpty: [ nil ]
