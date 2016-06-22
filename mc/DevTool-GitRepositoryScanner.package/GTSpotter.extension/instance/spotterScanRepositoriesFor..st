*DevTool-GitRepositoryScanner
spotterScanRepositoriesFor: aStep
	<spotterOrder: 90>
	
	aStep listProcessor			 
		allCandidates: [ GitRepositoryScanner uniqueInstance scan ];
		title: '[Git]FileTree local repositories';
		itemName: [ :item | item fullName ];
		itemIcon: [ :item | GitRepositoryScanner iconFor: item ];
		filter: GTFilterSubstring;
		actLogic: [ :item :step | 
			step exit.
			GitRepositoryScannerAddAction new 
				reference: item;
				execute ];
		wantsToDisplayOnEmptyQuery: true