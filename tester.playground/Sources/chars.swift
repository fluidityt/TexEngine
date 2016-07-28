import Foundation

     
//<##>  MARK:  - chars -

    ///////////////////////////////////////////
    // mAIN CLASS FOR CHARS ////////////////\/
    //////////////////////////////////////////
   public class Character
    {
        static var head_count   = 0
    
        var
            // Generals             
            name:String                      = "narrator"    ,
            nickname:String                  = ""            ,
            gender:e_Genders                 = .neutral      ,
            age                              = 0             ,
            race:e_Races                     = .nada         ,
			graphics:String					 = "graphics|"	 ,
			bat_stats						 = battle_stats(),

			// Personls
            trust:Int?                       = 0             ,
			trust_table:[String: Bool]       = [:]           ,
                            
            trait_table		                 = [
                
                bloodthirstiness   :   nada     ,
                trustworthiness    :   nada     ,
                kindness           :   nada     ,
        										]
		;
	
		var char_battle_inventory:[e_itm_names:Int]? = [:]
            { didSet { print(char_battle_inventory!) } }
     
        // UI stuff
        var message_font        = 0

		public struct
			battle_stats {
				public var             
					HP                       =   0           ,
					MP                       =   0           ,
									
					AP                       =   0           ,
					DEF                      =   0           ,
									
					condition                =   condition_list.normal,
					alive                    =   true        ,
									
					equipment                =   100         ,
					items                    =   [100]       ;
					
		}

        // Initialize
        init()
        {
            Character.head_count += 1
            trust_table["nobody"] = true
        }

    }//EOC

//<##>  MARK:  - custom chars -

    /** each character has there arwn shit they have to need */
	public class eidye : Character {
		// Special var for MC
		var party_list = Set<String>()

		override init()
		{
			super.init()

			// Basic inits
			age								= 24
			race							= .human
			gender							= .male
			name							= "Eidye"
			graphics						= "Eidye.graphics"
			trust 							= 100
			//bat_stats		= bs.init()

			// Tables
			trait_table[trustworthiness]	= max
			trust_table						= ["Mris": true]

		}
	}

   public class mris  : Character {
        override init()
        {
            super.init()
            
            age			= 24
            race		= .human
            gender		= .female
            name		= "Mris"
            trust		= 50

            
            // She trusts Eidye
            trust_table = ["Eidye": true]
            
            // She has a cool font style
            message_font = 1
        }
    }
    
   public class froyn : Character { 
        override init() 
        { 
            super.init()

            age          = 24
            race         = .human
            
            // She's a girl
            gender       = .female
            
            name         = "Froyn"
            trust        = 0

            // cuz she's the villain
         
            // an evil font
            message_font = 3  
        }
    }

//<##>  MARK:  - char funcs -

    // Trust check
    func checkIf( first: Character, trusts second: Character ) 
    {
        newLine()
        
        first.trust >= second.trust
        ?
            print("\(first.name) trusts \(second.name)")
        :
            print(first.name + " doesn't trust " + second.name)
         
    } 
    
    func checkIf( first: Character, hates second: Character ) 
    {
        newLine()
        
        first.trust >= second.trust
        ?
            print("\(first.name) trusts \(second.name)")
        :
            print(first.name + " doesn't trust " + second.name)
         
    }

	/*  FROM FUNCTIONS.SWIFT:::

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
	*/
