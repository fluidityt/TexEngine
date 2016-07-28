import Foundation

public class scene {
  
        
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
