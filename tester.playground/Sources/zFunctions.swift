import Foundation

//<##>  MARK:  - GENERAL FUNCS -

	public func log(s:String) { print("\nLOG: " + s + "\n") }

	public func remember(s:String) { print("\nREMEMBER: " + s + "\n") }

	public let newLine = {print("\n")}


//<##>  MARK:  - UX : CHARACTER -

	 //  pram only if a toon is talking :)
	// FIXME: fix the default to narrator
	public  func mwin(s:String, said this:Character = narrator ){
		// we don't want to print labels only for toons
		this.name != "narrator"
		?
			print(this.name + ": " + s)
		:
		print(s)

	};

	public func checkIfSheWillJoinParty()
		{
			var Mris = mris()
			var Eidye = eidye()
		
			if (Mris.trust_table["Eidye"] == true)
			{
				mwin("hi, I trust you so I'm in you're party now :D", said: Mris)
				
				// Add her to the party
				Eidye.party_list.insert("Mris")
				print(Eidye.party_list)
			}
			
		} 


//<##>  MARK:  - ITEM : CHARACTERS -

	// TODO: replace prams
	// FIXME: swap in enums and drop first outer pram
	public func giveA( which:Item, to this:Character)
	{   log("trying to give \(which) to \(this)")
		let itemname = which.name

		// FIXME: this will crash if we don't initialize. Make it an if let ? statement
		// TODO: add how many to sell, or do a for! loop in the market UI calling this
		// .. check if player has ANY in stock
		if let currentamount = this.char_battle_inventory?[itemname]
		{
			// If player has max, do nothing
			if currentamount >= which.max_quantity  {
				log("Already at max")                  }
			else                                                          {
				this.char_battle_inventory![itemname] = currentamount + 1 }

		}
			//  If player has NONE in stock, sell one
		else                                          {
			this.char_battle_inventory![itemname] = 1 }

	}

	public func takeA( which:Item, from this:Character)
	{   log("trying to take \(which) from \(this)")
		let itemname = which.name

		if let currentamount = this.char_battle_inventory?[itemname]
		{
			// If player has max, do nothing
			if currentamount <= 0                       {
				log("You have none!")                  }
			else                                                          {
				this.char_battle_inventory![itemname] = currentamount - 1 }
		}
			//  If player has NONE in stock, sell one
		else                                          {
			log("You have none!")
		}
	}
