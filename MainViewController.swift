//
//  ok.swift
//  TexEngine
//
//  Created by Dude Guy on 7/21/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import UIKit

///<##> MVC////////////////////////////////////////////////////
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
    
    
    
    func buttonPressed() {
        label.text = "Hello, \(textField.text!)"
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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.setNeedsUpdateConstraints()
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        
    }
    
}

/// Enums  //////////////////////////////////////////////////
enum PossibleChars {	//master list
    case Edye, Teyso }



///<##> Scene List //////////////////////////////////////////////

// STRUCTS


struct CharData {
    
    var my_chars		 =							[PossibleChars.Edye]	//check boolways
    
    mutating func filtrit(TYPZOR:PossibleChars) 	{ my_chars = my_chars.filter({$0 != $0}) }
    func checkEdye() 								{ my_chars.contains(.Edye) ?
        print("Oh shit it's Edye!") : print("nope")}
}

struct GameData {

		var SCN_next_clip = [0: {}]
        var SCN_next_scene = [0: ()]
    
        var SCN_superNC = 0
 
}; var GD = GameData()

struct SceneFuncs {
    
   func enter(ns: [Int: ()] = GD.SCN_next_scene, nc: [Int: ()->()] = GD.SCN_next_clip) {
    
    
    
        func playClip(clp:Int) 				{ nc[clp]!() }
    
        func test()			  				{
            GD.SCN_next_scene = LoadSceneCommands(0)
            GD.SCN_next_clip[0]!()
            GD.SCN_next_scene = LoadSceneCommands(1)
            GD.SCN_next_clip[1]!()}
        
        
        
        /// loadScene ///
        func LoadSceneCommands (scn:Int) -> [Int: ()] {
           
            var next_scene 	= ns
        	var next_clip	= nc
       		var superNC 	= 0
            
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
    
    
}

