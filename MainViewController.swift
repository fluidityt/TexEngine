//
//  ok.swift
//  TexEngine
//
//  Created by Dude Guy on 7/21/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import UIKit

var debug_total = 0

func debug(text:String,_ value:Any)
{
	debug_total += 1
	print("\(debug_total) \(text) \(value)")
}

var firstrun = true

///<##> MVC //////////////////////////////////////////////////
// MARK: - MVC -
class MainViewController: UIViewController, UITextFieldDelegate {
	
	lazy var textField: UITextField! = {
		let view = UITextField()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.borderStyle = .RoundedRect
		return view
	}()
	
	lazy var button: UIButton! = {
		let view = UIButton()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.addTarget(self,
		               action: #selector(MainViewController.buttonPressed),
		               forControlEvents: .TouchDown);
		view.setTitle("Press Me!", forState: .Normal)
		view.backgroundColor = UIColor.blueColor()
		return view
	}() 
	
	lazy var label: UILabel! = {
		let view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.text = "HEY"
		view.textAlignment = .Center
		
		return view
	}()
	
	
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		// Dismisses the Keyboard by making the text field resign
		// first responder
		textField.resignFirstResponder()
		
		// returns false. Instead of adding a line break, the text
		// field resigns
		return false
	}
	
	override func updateViewConstraints() {
		
		
		func textFieldConstraints() {
			
			NSLayoutConstraint(
				item: textField,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			NSLayoutConstraint(
				item: textField,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.8,
				constant: 0.0)
				.active = true
			
			
			NSLayoutConstraint(
				item: textField,
				attribute: .Top,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Bottom,
				multiplier: 0.1,
				constant: 0.0)
				.active = true
		}
		
		func buttonConstraints() {
			// Center button in Page View
			NSLayoutConstraint(
				item: button,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			// Set Width to be 30% of the Page View Width
			NSLayoutConstraint(
				item: button,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.3,
				constant: 0.0)
				.active = true
			
			// Set Y Position Relative to Bottom of Page View
			NSLayoutConstraint(
				item: button,
				attribute: .Bottom,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Bottom,
				multiplier: 0.9,
				constant: 0.0)
				.active = true
		}
		
		func labelConstraints() {
			// Center button in Page View
			NSLayoutConstraint(
				item: label,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			// Set Width to be 80% of the Page View Width
			NSLayoutConstraint(
				item: label,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.8,
				constant: 0.0)
				.active = true
			
			// Set Y Position Relative to Bottom of Page View
			NSLayoutConstraint(
				item: label,
				attribute: .CenterY,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterY,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
		}
		
		textFieldConstraints()
		buttonConstraints()
		labelConstraints()
		
		super.updateViewConstraints()
		
	}
	
	func buttonPressed() {
		doscene()
	}
	
	
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		view.addSubview(textField)
		view.setNeedsUpdateConstraints()
		view.addSubview(textField)
		view.addSubview(button)
		view.addSubview(label)
		
		
		GD.scn_next_scene = 0
		GD.scn_next_clip = 0
		
		
	}
	///DOSCENE¡///<##> 
	func doscene() {
		
		//temp inits
		var next_scene = GD.scn_next_scene
		
		var next_clip:Int
			next_clip = GD.scn_next_clip
		
		var scene_info  = GD.scn_scene_info
		
		var debugged	= 0
		
		var current_scene = GD.scn_current_scene
		
		
		// internal funcs
		func say(text: String){
			print(text)
			label.text = text}
		
		func setStage( scn:Int,_ clp:Int) 	{
			next_scene = scn
			next_clip  = clp		}
		
		func setClip(clp:Int)		{
			next_clip = clp		}
		
		// let findNextScene = {}
		
		// Load scene info if next_scene time
		if(next_scene > current_scene)
		{
			say("\n Loading scene...")
			// Switch next_scene, loading data into scene_info
			switch(next_scene) {
				
			// scene 0
			case 0:    
				say("0 set")
				scene_info = [
					
					// clip 0
					0: {
						say("clip 0 activated")
						setStage(1, 0)
					}
				]
				
			// scene 1
			case 1:
				
				say("1 set")
				
				scene_info = [
					
					// clip 0
					0: {
						say("s1 c0 playing")
						setClip(1)						
					},
					
					// clip 1
					1: {
						setClip(0)
						say("s1 c1 playing. ((nc = \(next_clip)))")
						debugged += 1
						
					}
					
				]
				
				
			// scene error
			default: say("ERROR: no scene")	
				
			}
			
			// For next entry 
			// ONLY THING SO FAR IS LOADING INFO
			// NO UNWRAPPING
			GD.scn_current_scene = next_scene
			GD.scn_scene_info 	=  scene_info
			
		}
		else 
		{
			print("\n Scene isn't over yet..")
		}
		say("out of logic: ((nc = \(next_clip)))")
		
		
		// Play next clip
		scene_info[next_clip]!()
		
		
		// Update struct
		GD.scn_next_scene = next_scene
		GD.scn_next_clip  = next_clip
		
		
		
		
		say("leaving doscene \(debugged)")
		
	}
	
}
///<##> Other stuff ////////////////////////////////////////////////
// MARK: - OTHER -

enum PossibleChars {	//master list
	case Edye, Teyso }


struct CharData {
	
	var my_chars		 =							[PossibleChars.Edye]	//check boolways
	
	mutating func filtrit(TYPZOR:PossibleChars) 	{
		my_chars = my_chars.filter({$0 != $0}) }
	
	func checkEdye() 								{
		my_chars.contains(.Edye) ? print("Oh shit it's Edye!") : print("nope")}
}


struct GameData {
	
	var scn_current_scene = -1
	var scn_scene_info = [-1: {}]
	
	
	var scn_next_scene = -1
	var scn_next_clip = -1
	
	
	
	
}; var GD = GameData()



