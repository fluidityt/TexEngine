import Foundation


	// ENUMS
   
    public enum 
        e_Quantities { case some,alot,alittle,few, nada, many,very,somewhat}
                public let
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
    public enum
        e_PersonalityTraits{  case trustworthy, bloodthirsty, kind }
            public let
                trustworthiness               = e_PersonalityTraits.trustworthy      ,
                bloodthirstiness              = e_PersonalityTraits.bloodthirsty     ,
                kindness                      = e_PersonalityTraits.kind             
    ;

        
    // others               
    public enum e_Races { case                      human, robot, nada }
                        
    public enum e_Genders { case                    neutral, female, other, male }
                    
    
    // TODO: Migrate this later    
    public enum
        condition_list  {case   
            normal, confused, poisoned }
                
    
    // Item Enums
    public enum
        e_item_type { case
            use, equip, obtain,
            battle, equipment, key, blank }
               public  let
                    eUse                    = e_item_type.use, 
                    eEquip                  = e_item_type.equip,
                    eObtain                 = e_item_type.obtain,
                    eKey                    = e_item_type.key,
                    eBattle                 = e_item_type.battle,
                    eEquipment              = e_item_type.equipment
    ;

    public enum
        e_itm_names    { case
            bomb, potion, blank }
                public let
                    eBomb                   = e_itm_names.bomb,
                    ePotion                 = e_itm_names.potion
    ;
    
    public struct
        battle_stats {
            public var                 
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
