//
//  mvc.swift

import UIKit

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
	
	
	
	// button press
	func buttonPressed() {
		SL.doScene(with: 1)
		
	}
	
	func button2Pressed() {
		SL.doScene(with: 2)
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
}

