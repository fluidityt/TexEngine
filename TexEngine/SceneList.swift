
//
//  SceneList.swift

import Foundation


/*
struct SceneData {
		var current_scene = -1
		var scene_info = [-1: {}]
		
		
		var next_scene = -1
		var next_clip = -1
} 

*/




/**Scene List is auto-generated from my editor, because I am a lazy FUCK only has one function, doScene()
will eventually have the option selected
- seealso: 
````
		var current_scene = -1
		var scene_info = [-1: {}]
		
		
		var next_scene = -1
		var next_clip = -1
````*/ 
struct SceneList {
	
	
	
	/** ......
	- parameter with choice: runs selection in from button
	
	*/ 
	func doScene(with choice:Int) {
		
		// Gets saved to later
		var temp = GD.scn
		var label = GD.ux.label
		
		// internal funcs
		func say(text: String){
			print(text)
			GD.ux.label.text = text}
		
		// Find the next scene!
		if(temp.next_scene > temp.current_scene) {			
			GD.ux.label.text = "FUNNNN"
			
			switch(temp.next_scene) {
			
				
				
			//  MARK:  - scene 0 -
			case 0:    
				say("0 set")
				temp.scene_info = [
					
					// clip 0
					0: {
						say("clip 0 activated")
						
						temp.next_scene = 1
						temp.next_clip = 0
					}
				]
				
				
				
				
				
			//  MARK:  - scene 1 -<##>
			case 1:
				
				say("1 set")
				
				temp.scene_info = [
					
					// clip 0
					0: {
						say("S1   C0  ")
						
						temp.next_clip = 1					
					},
					
					// clip 1
					1: {
						say("  S1  C1 ")
						
						temp.next_scene = 2
						temp.next_clip = 0					
					}
					
				]	
			
			//  MARK:  - scene 2-
			case 2:
				
				say("2 set")
				
				// scene info 
				temp.scene_info = [
					
					// clip 0
					0: {
						
						label.hidden = true
						
						say("Scene 2: The Wild Blue FUUUUCK")
						
						temp.next_clip = 1
					},
					
					// clip 1
					1: {
						
						label.hidden = false
						
						choice == 1 ? say("You are cool :D") : {}()
						choice == 2 ? say("You are dumb D:") : {}()
						
						
						temp.next_clip = 0					
					}
					
				]
				
				
				
				
				
			// scene error
			default: say("ERROR: no scene")	
				
			}
			
			
		}
		
		// Play next clip BECAUSE I'M LAZY AND WANT THE JUMPMARK
		func playClip() {
			
			// Unwrap to play!
			temp.scene_info[temp.next_clip]!()
			
			// Reassign...
			GD.scn = temp
			GD.ux.label = label
		}; playClip()
		
		
		print("leaving doscene \n")
	}
}

	
