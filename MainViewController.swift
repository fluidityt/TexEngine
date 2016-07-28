//
//  mvc.swift

import UIKit

var firstrun = true






///<##> MVC //////////////////////////////////////////////////
// MARK: - MVC -
class MainViewController: UIViewController, UITextFieldDelegate {
	
	
	
	
	
	// button press
	func button1Pressed() {
		SL.doScene(with: 1)
		
	}
	
	func button2Pressed() {
		SL.doScene(with: 2)
	}
	
	
	
	// vdl
	override func viewDidLoad() {
		
		super.viewDidLoad()
		view.setNeedsUpdateConstraints()
		view.addSubview(GD.ux.button_2)
		view.addSubview(GD.ux.label)
		view.addSubview(GD.ux.button_1)
		
		
		GD.scn.next_scene = 0
		GD.scn.next_clip = 0
		
		GD.ux.button_2.hidden = true
	}
	
	
	
	
	// uvc
	override func updateViewConstraints() {
		func button2Constraints() {
			// Center button in Page View
			NSLayoutConstraint(
				item: GD.ux.button_2,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			// Set Width to be 30% of the Page View Width
			NSLayoutConstraint(
				item: GD.ux.button_2,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.3,
				constant: 0.0)
				.active = true
			
			// Set Y Position Relative to Bottom of Page View
			NSLayoutConstraint(
				item: GD.ux.button_2,
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
				item: GD.ux.button_1,
				attribute: .CenterX,
				relatedBy: .Equal,
				toItem: view,
				attribute: .CenterX,
				multiplier: 1.0,
				constant: 0.0)
				.active = true
			
			// Set Width to be 30% of the Page View Width
			NSLayoutConstraint(
				item:  GD.ux.button_1,
				attribute: .Width,
				relatedBy: .Equal,
				toItem: view,
				attribute: .Width,
				multiplier: 0.3,
				constant: 0.0)
				.active = true
			
			// Set Y Position Relative to Bottom of Page View
			NSLayoutConstraint(
				item:  GD.ux.button_1,
				attribute: .Bottom,
				relatedBy: .Equal,
				toItem:  GD.ux.button_2,
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

