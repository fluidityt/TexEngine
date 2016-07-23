//
//  GameData.swift

import Foundation
import UIKit


/** Game Data holds all my shit for all my other shit so they can shit on each other without getting any of the crap on me */ 
struct GameData {
	
	
	/**  
	SceneStuff holds things for SceneList mostly. 
	 */
	struct SceneData {
		var current_scene = -1
		var scene_info = [-1: {}]
		
		
		var next_scene = -1
		var next_clip = -1
	}; var scn = SceneData()
	
	
	/** UX stuff holds buttons and shit so I don't have to */ 
	struct UXStuff { 
		
		// label
		var label: UILabel
		
		init (){
			let view = UILabel()
			view.translatesAutoresizingMaskIntoConstraints = false
			view.text = "Super Fun Game!" +
			"\n(I Think)"
			view.textAlignment = .Center
			view.textColor = UIColor.whiteColor()
			view.backgroundColor = UIColor.blackColor()
			view.numberOfLines = 10
			view.adjustsFontSizeToFitWidth = true
			
			label = view
			
		}
	}; var ux = UXStuff()
	
}