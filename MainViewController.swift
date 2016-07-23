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
		
		
		GD.scn.next_scene = 0
		GD.scn.next_clip = 0
		
		
	}
	///DOSCENE¡///<##> 
	func doscene() {
		
		var temp = GD.scn
					
		
		// internal funcs
		func say(text: String){
			print(text)
			label.text = text}
		
				
		// let findNextScene = {}
		
		if(temp.next_scene > temp.current_scene) {			
			switch(temp.next_scene) {
				
			// scene 0
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
				
			// scene 1
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
			
		
		say("leaving doscene \n")
		
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
	
	struct SceneStuff {
		var current_scene = -1
		var scene_info = [-1: {}]
		
		
		var next_scene = -1
		var next_clip = -1
	}
	
	var scn = SceneStuff()
	
	
}; var GD = GameData()



