//
//  ok.swift
//  TexEngine
//
//  Created by Dude Guy on 7/21/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import UIKit



///<##> MVC  ////////////////////////////////////////////////////
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
        enter(OPTSELECT: 1)}
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.setNeedsUpdateConstraints()
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
  }
    
   ///Mainloop
   func enter(OPTSELECT os:Int) {
    
    // BECAUSE I CAN'T USE == ...FFS!
    var same_scene = true;    var same_clip = true
    
    // Temp vars
    var scene 	= GD.scn_scene
    var clip	= GD.scn_clip
    
    var next_scene = GD.scn_next_scene
    var next_clip = GD.scn_next_clip

    
    func say(text: String){
            print(text)
            label.text = text}
    
        /// loadScene ///
        func LoadSceneCommands (scn:Int) -> [Int: ()] {
           
            // sub-sub funcs
            func setStage( scn:Int,_ clp:Int) 	{
                next_scene = LoadSceneCommands(scn)
                next_clip = clp
                same_scene = false;                same_clip = false                }
            
            func nextClip(willbe clp: Int){
                next_clip = clp
                same_clip = false}
                
            
            switch(scn) {
                
            // scene intro
            case 0:    return [0: {
                
                // clipz
                clip = [0: {
                    
                    
                    
                    }
                ]}()]
                
            // scene 1
            case 1:
            
              return [1: {
                
                
                clip = [
                    
                    // clip into
                    0: {
                        
                        
                    },
                    
                    // clip 1
                    1: {
                        
                    },
                    
                ]
                }()]
                
            // scene fail
            default: return [-1: print("no scene")]}	// Use -1 for EC purposes?
            
    }
    
    
 
    
        func testPlayClip(clip_num:Int) 				{ clip[clip_num]!() }
    

    }
    
    
}


/// Enums  //////////////////////////////////////////////////
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
        var scn_scene = [0: ()]

		var scn_clip = [0: {}]
    
        var scn_next_scene = [0: ()]
    	var scn_next_clip = 0
    
    
        var SCN_superNC = 0
 
}; var GD = GameData()



