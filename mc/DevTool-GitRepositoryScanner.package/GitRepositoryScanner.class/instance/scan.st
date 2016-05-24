scanning
scan 
	^ self roots 
		inject: #()
		into: [ :all :each | all, (self scanForRepositories: each) ]