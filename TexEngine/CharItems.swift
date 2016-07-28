//
//  CharItems.swift
//  TexEngine
//
//  Created by Dude Guy on 7/27/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

func todolist()
{
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

}

func log(s:String) { print("\nLOG: " + s + "\n") }

func remember(s:String) { print("\nREMEMBER: " + s + "\n") }

let newLine = {print("\n")}

remember("USE WILLSET DIDSET FOR DEBUGGING :d    ENUM POWERRRR   STRUCT VS CLASSES IN FUNCS")

///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

    // ENUMS
   
    enum 
        e_Quantities { case some,alot,alittle,few, nada, many,very,somewhat}
                let
                   some                       = e_Quantities.some     ,
                   alot                       = e_Quantities.alot     ,
                   few                        = e_Quantities.few      ,
                   many                       = e_Quantities.many     ,
                   alittle                    = e_Quantities.alittle  ,
                   very                       = e_Quantities.very     ,
                   somewhat                   = e_Quantities.somewhat ,
                   nada                       = e_Quantities.nada     
    ;
    
    // character traits
    enum
        e_PersonalityTraits{  case trustworthy, bloodthirsty, kind }
            let
                trustworthiness               = e_PersonalityTraits.trustworthy      ,
                bloodthirstiness              = e_PersonalityTraits.bloodthirsty     ,
                kindness                      = e_PersonalityTraits.kind             
    ;

        
    // others               
    enum e_Races { case                      human, robot, nada }
                        
    enum e_Genders { case                    neutral, female, other, male }
                    
    
    // TODO: Migrate this later    
    enum
        condition_list  {case   
            normal, confused, poisoned }
                
    
    // Item Enums
    enum 
        e_item_type { case
            use, equip, obtain,
            battle, equipment, key, blank }
                let
                    eUse                    = e_item_type.use, 
                    eEquip                  = e_item_type.equip,
                    eObtain                 = e_item_type.obtain,
                    eKey                    = e_item_type.key,
                    eBattle                 = e_item_type.battle,
                    eEquipment              = e_item_type.equipment
    ;

    enum
        e_itm_names    { case
            bomb, potion, blank }
                let
                    eBomb                   = e_itm_names.bomb,
                    ePotion                 = e_itm_names.potion
    ;
    
    struct
        battle_stats {
            var                 
                HP                            =   0           ,
                MP                            =   0           ,
                                
                AP                            =   0           ,
                DEF                           =   0           ,
                                
                condition                     =   condition_list.normal,
                alive                         =   true        ,
                                
                equipment                     =   100         ,
                items                         =   [100]       ;
                
        }
    ;
    
    // For using and equipping
    class 
        Item {
            // Default item values
            var         
                name                        = e_itm_names.blank     ,  
                max_quantity                = 0                     ,           
                type                        = e_item_type.blank     ,
                price:Int?                  = 0                     ,
                icon                        = "blank.png"           ,
                description                 = "a blank item"
            ;    
            
        }
    ;
        
    class
        Equippable : Item {
            var
                equip                       = {}                  ,       
                slot                        = "blank"             ,
                boost                       = ["HP": 0]           ,
                sprited                     = "equip_blank.png"
            ;
                            
            override init()                   { super.init()
                max_quantity                  = 1
                type                          = e_item_type.equipment
            }   
        }
    ;
        
    class 
        Usable : Item {
            var
                use                          = {}                    ,       
                boost                        = ["HP": 0]             ,
                battle_sfx                   = "blank.wav"           ,
                battle_anim                  = "blank.anim"
            ;
            
            override init()                  { super.init()
                max_quantity                 = 10
                type                         = e_item_type.battle
            }   
        }
    ;
    
    class
        Key : Item {
            var
                found_during                 = "scene 0"     ,
                needed_during                = "scene 0"     ,
                acquire_effects              = ["HP": 0]     
            ;
                        
            override init()                  { super.init()
                max_quantity                 = 1
                type                         = e_item_type.key
                price                        = nil
            }   
        }
    ;
    
    func equip  ( which: Character, with this: Item  ) {}
    func use    ( a: Item, on this: Character ) {}
    func obtain ( which:Character, gets this: Item   ) {}

var bomb = 

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

       
       

    ///////////////////////////////////////////
    // mAIN CLASS FOR CHARS ////////////////\/
    //////////////////////////////////////////
    class Character
    {
        static var head_count   = 0
    
        var
            // Generals             
            name:String                      = ""            ,
            nickname:String                  = ""            ,
            gender:e_Genders                 = .neutral      ,
            age                              = 0             ,
            race:e_Races                     = .nada         ,
                    
            // Personls             
            trust:Int?                       = 0             ,
            trust_table                      :
                [String: Bool]               =
                    [:]                                      ,
                            
            default_char_traits              = [
                
                bloodthirstiness   :   nada     ,
                trustworthiness    :   nada     ,
                kindness           :   nada     ,
        ]                                       ;
     
        // UI stuff
        var message_font        = 0
      
        // Initialize
        init()
        {
            Character.head_count += 1
            trust_table["nobody"] = true
        }
    }//EOC

    /** each character has there arwn shit they have to need */
    class eidye : Character { 
        // Special var for MC
        var party_list = Set<String>()
      
        override init() 
        {
            super.init()
            age = 24
            race = .human
            gender = .male
            name = "Eidye"
        
            // Trusty heroes :)
            //addTrait(.trustworthy) 
            trust = 100
        }
    }
    
    class mris  : Character {    
        override init()    
        {
            super.init()
            
            // Basic inits
            age = 24
            race = .human
            gender = .female
            name = "Mris"
            trust = 50
           // addTrait(.neutral)
            
            // She trusts Eidye
            trust_table = ["Eidye": true]
            
            // She has a cool font style
            message_font = 1
        }
    }
    
    class froyn : Character { 
        override init() 
        { 
            super.init()
            
            age = 24
            race = .human
            
            // She's a girl
            gender = .female
            
            name = "Froyn"
            trust = 0 
            
            // cuz she's the villain
         
            // an evil font
            message_font = 3  
        }
    }

var Eidye = eidye(); var narrator = Character(); var Mris = mris(); 
//narrator.name = "narrator"

    
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
    
//checkIf(Eidye, trusts: Mris)
//newLine()
//checkIf(Mris, trusts: Eidye)
    
    //  pram only if a toon is talking :)
    func mwin(s:String, said this:Character = narrator ){
        // we don't want to print labels only for toons
        this.name != "narrator"
        ?
            print(this.name + ": " + s)
        :
            print(s)
        
    }; 





////////////////////////////////////scene///////////////////////////////////////////////
    class scene {
  
        
        static var clips    = [0: {}]
        
       // static var current  = 0
        static var next     = 0  {
            didSet {
            
                switch(next){
                    case 1:  
                        clips = [0: {print("scene 1"); next = 2}]
                    
                    case 2:
                        clips = [0: {print("Scene 2"); next = 3},
                                 1: {print("It was cloudy at clip 1"); next = 3}]    
                    case 3:
                        clips = [0: {print("scene 3"); next = 4}]
                      
                    case 4:
                        clips = [
                                    0: { print("The first real one") },
                                    
                                    1: {
                                        
                                        mwin("The night was dark")
                                        mwin("Things are bad,", said: Eidye)
                                    }
                                    
                                    ]
                      
                        
                    default:
                        clips = [0: {print("no scene")}]
                
                }
                
               
            }
        }
        
        static var play = 0
        {
          didSet {
          clips[play]!()}
            
        }
          
        static var loop = 0
        {
              didSet {
                  loop += 1
                  print(loop)
              }
        }
    
        static func test()
        {    
            scene.loop = 1
            scene.next = 1
            scene.play = 0
        }
    }//EOC
    
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
