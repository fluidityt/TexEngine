
import Foundation
//<##>
    /*
    - what do i need spritekit for
    - what of this can transfer to watch game
    - i do need are methods

    - idea,, have a relationship table that auto-updates only when.. +1
    
    - figure out ! vs ? with arrays and such var![x] vs var[x]! and so on
            - aparently you have to call it with var![x]! 
            
    - Figure out the log and ! issue. Probably something with generics or Any 
       or a converter

    - : implement inout/generics for local functions
    - TODO: switch items to LET
    
	- learn about literals

	- learn about _
	- learn guard / defer
    */

// giveA(bomb, to: testy)
// takeA(bomb, from: testy)

  

//

        
//checkIf(Eidye, trusts: Mris)
//newLine()
//checkIf(Mris, trusts: Eidye)
    

////////////////////////////////////scene///////////////////////////////////////////////

var blanku = Usable();

public class BattleInstance {
	public var
		cache_item = blanku,
		targeter = Eidye,
		targeted = Bug

}; public var BI = BattleInstance();


var bomb = Usable()
bomb.use = { print("boomb") }
bomb.name = .bomb
	bomb.max_quantity = 5
// <##>
	giveA(bomb, to: Eidye)
	bomb.use()

	let fun = 4
	var cool = 5

////////// DO BATTLE ////////
	// TODO: Add enemy?
    func doBattle(pressed_button:Int) -> Bool
    {
			/*
			(enter: load variables)
			- refresh variables
			- update screen
			- wait for input
			- do logic
			*/

		// Loop tester
		cool += 1



			var cp = Eidye
//<##>
			// End of doBattle returns this variable (breaking or staying in loop)
			var
				battle_finished			= false,
				enHP					= Bug.hp,
				enAP					= Bug.ap,
				cpHP					= cp.hp,
				cpAP					= cp.ap;


		mwin("Welcome to the battle...")

			// option 1, fight
			func fight()
			{

			}

			func useItem()
			{

/*
dobattle {
playerTurn {
useItem {
targeter = x
targeted = y

pickItem (item) {
item.use {
*/
			}

		// Test breakout
		if(cool == 10) { return true }
		


		// Return to exit / stay in outer loop
		if(battle_finished == true)		{
			return(true)				}
		else							{
			return (false)				}


	}


///////// MAIN AREA  //////
//
//while false {y
//	var funt = doBattle(1)
//	if funt == true{ break}
//}





























//<##>
