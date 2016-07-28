//
//  Character.swift
//  TexEngine
//
//  Created by Dude Guy on 7/23/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

struct CharData {
	
	var my_chars		 =							[PossibleChars.Edye]	//check boolways
	
	mutating func filtrit(TYPZOR:PossibleChars) 	{
		my_chars = my_chars.filter({$0 != $0}) }
	
	func checkEdye() 								{
		my_chars.contains(.Edye) ? print("Oh shit it's Edye!") : print("nope")}
}


enum PossibleChars {	//master list
	case Edye, Teyso }

public func sayHi()
{
print("Hi tharr wurldz!")
}