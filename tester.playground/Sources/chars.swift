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
   public class eidye : Character {
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
    
   public class mris  : Character {
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
    
   public class froyn : Character { 
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
