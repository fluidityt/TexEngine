//
//  SceneList.swift
//  TexEngine
//
//  Created by Dude Guy on 7/23/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation



/**  
SceneStuff holds things for SceneList mostly. I don't put them together because I'm not an OOP-head.
*/
struct SceneStuff {
		var current_scene = -1
		var scene_info = [-1: {}]
		
		
		var next_scene = -1
		var next_clip = -1
	}; var scn = SceneStuff()


/** Scene List is auto-generated from my editor, because I am a lazy FUCK only has one function, doScene()
will eventually have the option selected

- parameter optionselected: runs mats in
- seealso: GameData.SceneList
*/ 
struct SceneList {

	func doScene() {
		
		var temp = GD.scn
		
		
		// internal funcs
		func say(text: String){
			print(text)
			GD.ux.label.text = text}
		
		
		// let findNextScene = {}
		
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
				
			//  MARK:  - scene 1 -
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
						temp.next_clip = 0					
					}
					
				]
				
				
				
			// scene error
			default: say("ERROR: no scene")	
				
			}
			
			
		}
		
		
		
		// Play next clip
		temp.scene_info[temp.next_clip]!()
		
		
		GD.scn = temp
		
		
		print("leaving doscene \n")
		
	}
}

	
