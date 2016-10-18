private testing
isIcebergPresent
	^ (Smalltalk globals at: #Iceberg ifAbsent: [ nil ]) notNil		