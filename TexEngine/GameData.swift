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
		var button_1: UIButton
		var button_2: UIButton

		init ()
		{

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



			// button 1

				let view1 = UIButton()
				view1.translatesAutoresizingMaskIntoConstraints = false
				view1.addTarget(view1,
				               action: #selector(MainViewController.button1Pressed),
				               forControlEvents: .TouchDown);
				view1.setTitle("Start Game", forState: .Normal)
				view1.backgroundColor = UIColor.blackColor()
				button_1 = view1



			// button 2

				let view2 = UIButton()
				view2.translatesAutoresizingMaskIntoConstraints = false
				view2.addTarget(view2,
				               action: #selector(MainViewController.button2Pressed),
				               forControlEvents: .TouchDown);
				view2.setTitle("Retry", forState: .Normal)
				view2.backgroundColor = UIColor.blueColor()
				button_2 = view2

		}
	}; var ux = UXStuff()
	
}