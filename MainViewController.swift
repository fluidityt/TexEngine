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
/** 
- parameters: 
   - cubes: The cubes available for allocation
  - people: The people that require cubes 
*/
var firstrun = true






///<##> MVC //////////////////////////////////////////////////
// MARK: - MVC -
class MainViewController: UIViewController, UITextFieldDelegate {
	
	
	// button 1
	lazy var button: UIButton! = {
		let view = UIButton()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.addTarget(self,
		               action: #selector(MainViewController.buttonPressed),
		               forControlEvents: .TouchDown);
		view.setTitle("Start Game", forState: .Normal)
		view.backgroundColor = UIColor.blackColor()
		return view
	}() 
	
	// button 2
	lazy var button2: UIButton! = {
		let view = UIButton()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.addTarget(self,
		               action: #selector(MainViewController.button2Pressed),
		               forControlEvents: .TouchDown);
		view.setTitle("Retry", forState: .Normal)
		view.backgroundColor = UIColor.blueColor()
		return view
	}() 	
	
	
	
	
	
	// uvc
	override func updateViewConstraints() {
		func button2Constraints() {
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
		func buttonConstraints() {
			// Center button in Page View
			NSLayoutConstraint(
				item: button2,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			// Set Width to be 30% of the Page View Width
			NSLayoutConstraint(
				item: button2,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.3,
				constant: 0.0)
				.active = true
			
			// Set Y Position Relative to Bottom of Page View
			NSLayoutConstraint(
				item: button2,
				attribute: .Bottom,
				relatedBy: .Equal,
				toItem: button,
				attribute: .Bottom,
				multiplier: 0.9,
				constant: 0.0)
				.active = true
		}
		
		func labelConstraints() {
			// Center button in Page View
			NSLayoutConstraint(
				item: GD.ux.label,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			// Set Width to be 80% of the Page View Width
			NSLayoutConstraint(
				item: GD.ux.label,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.8,
				constant: 0.0)
				.active = true
			
			//hight
			NSLayoutConstraint(
				item: GD.ux.label,
				attribute: .Height,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Height,
				multiplier: 0.7,
				constant: 0.0)
				.active = true
			// Set Y Position Relative to Bottom of Page View
			NSLayoutConstraint(
				item: GD.ux.label,
				attribute: .CenterY,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterY,
				multiplier: 0.8,
				constant: 0.0)
				.active = true
		}
		
		
		buttonConstraints()
		button2Constraints()
		labelConstraints()
		
		super.updateViewConstraints()
		
	}
	
	
	// button press
	func buttonPressed() {
		SL.doscene()
		
	}
	
	func button2Pressed() {
		SL.doscene()
	}
	
	
	
	// vdl
	override func viewDidLoad() {
		
		super.viewDidLoad()
		view.setNeedsUpdateConstraints()
		view.addSubview(button2)
		view.addSubview(GD.ux.label)
		view.addSubview(button)
		
		
		GD.scn.next_scene = 0
		GD.scn.next_clip = 0
		
		button2.hidden = true
	}
	
	
	
	
	
}





struct CharData {
	
	var my_chars		 =							[PossibleChars.Edye]	//check boolways
	
	mutating func filtrit(TYPZOR:PossibleChars) 	{
		my_chars = my_chars.filter({$0 != $0}) }
	
	func checkEdye() 								{
		my_chars.contains(.Edye) ? print("Oh shit it's Edye!") : print("nope")}
}


enum PossibleChars {	//master list
	case Edye, Teyso }

