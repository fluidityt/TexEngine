//: Playground - noun: a place where people can play
print("hi")
struct GameData {

		var SCN_next_clip = [0: {}]
        var SCN_next_scene = [0: {}()]
    
        var SCN_superNC = 0
    init(){}
}; var GD = GameData()


   // func enter(next_scene: [Int: ()]) {
    	var next_scene: [Int: ()]
    

        SCN_next_clip = [0: {}]
        SCN_next_scene = [0: {}()]

        func playClip(clp:Int) 				{ next_clip[clp]! }
        func test()			  				{
            next_scene = LoadSceneCommands(0)
            next_clip[0]!()
            next_scene = LoadSceneCommands(1)
            next_clip[1]!()}
        
        
        
        /// loadScene ///
        func LoadSceneCommands (scn:Int) -> [Int: ()] {
            
            func nextClipIs(number clp:Int)		{ superNC = clp }
            func setStage( scn:Int,_ clp:Int) 	{ next_scene = LoadSceneCommands(scn);  superNC = clp }
            
            switch(scn) {
                
            // scene none
            case 0:    return [0: {
                
                print("ns[0]: GInc initialized")
                
                next_clip = [0: {
                    
                    print("nc[0]no scene, no clip, just inits")
                    setStage(1,1)} ]}()]				// somehow this works... recursion?
                
            // scene 1
            case 1:    return [1: {
                
                print("ns[1]: scene 1 set")
                
                next_clip = [1: {
                    
                    print("nc[1]: playing scene 1, clip 1")} ]}()]
                
            // scene fail
            default: return [-1: print("no scene")]}	// Use -1 for EC purposes?
        }
        
    }
    
    

