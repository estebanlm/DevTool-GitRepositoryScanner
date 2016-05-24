*DevTool-GitRepositoryScanner
spotterScanRepositoriesFor: aStep
	<spotterOrder: 90>
	
	aStep listProcessor			 
		allCandidates: [ GitRepositoryScanner uniqueInstance scan ];
		title: '[Git]FileTree local repositories';
		itemName: [ :item | item fullName ];
		itemIcon: [ :item | GitRepositoryScanner iconFor: item ];
		filter: GTFilterSubstring;
		actLogic: [ :item :step | | repository |
			step exit.
			repository := GitRepositoryScanner uniqueInstance 
				addRepository: item
				ifAlreadyPresent: [ :aRepository |
					UIManager default inform: ('{1} is already present.' 
						format: { aRepository description }) ].
			repository ifNotNil: [ repository morphicOpen ] ];
		wantsToDisplayOnEmptyQuery: true