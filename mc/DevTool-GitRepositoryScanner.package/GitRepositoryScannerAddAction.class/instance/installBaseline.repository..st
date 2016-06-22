private
installBaseline: aReference repository: repository
	Metacello new 
		repository: repository location;
		baseline: (aReference base allButFirst: 10);
		load.