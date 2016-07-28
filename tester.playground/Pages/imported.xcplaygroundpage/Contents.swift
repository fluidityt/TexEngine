
import Foundation

    /*
    - what do i need spritekit for
    - what of this can transfer to watch game
    - i do need are methods

    - idea,, have a relationship table that auto-updates only when.. +1
    
    - figure out ! vs ? with arrays and such var![x] vs var[x]! and so on
            - aparently you have to call it with var![x]! 
            
    - Figure out the log and ! issue. Probably something with generics or Any 
       or a converter
       
    - TODO: implement inout/generics for local functions
    - TODO: switch items to LET
    
    */






var bomb = Item()

	/////// TESTCHAR  STUFF    //////////////////////////
    class
        testchar {
            var char_battle_inventory:[e_itm_names:Int]? = [:]
            { didSet { print(char_battle_inventory!) } }
    
    }

var testy = testchar()
    
    // TODO: replace prams
    // FIXME: swap in enums and drop first outer pram
    func giveA( which:Item, to this:testchar)
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
    
    func takeA( which:Item, from this:testchar)
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


// giveA(bomb, to: testy)
// takeA(bomb, from: testy)

  
var Eidye = eidye(); var narrator = Character(); var Mris = mris(); 
//narrator.name = "narrator"

        
//checkIf(Eidye, trusts: Mris)
//newLine()
//checkIf(Mris, trusts: Eidye)
    
 





////////////////////////////////////scene///////////////////////////////////////////////
        
    func checkIfSheWillJoinParty()
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


    func doBattle(pressed_button:Int)
    {
            
    }
