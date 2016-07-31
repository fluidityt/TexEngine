import Foundation

// <##> MARK:  - items -

// For using and equipping

public class
	Item {
		// Default item values
		public var
		name                        = e_itm_names.blank     ,
		max_quantity                = 0                     ,
		type                        = e_item_type.blank     ,
		price:Int?                  = 0                     ,
		icon                        = "blank.png"           ,
		description                 = "a blank item"
		;

	public init(){}

	}
;

public class
	Equippable : Item {
		var
		equip                       = {}                  ,
		slot                        = "blank"             ,
		boost                       = ["HP": 0]           ,
		sprited                     = "equip_blank.png"
		;

		override init()                   { super.init()
			max_quantity                  = 1
			type                          = e_item_type.equipment
		}
	}
;

public class
	Usable : Item {
		public var
		use                          = {}                    ,
		boost                        = ["HP": 0]             ,
		battle_sfx                   = "blank.wav"           ,
		battle_anim                  = "blank.anim"		     
		;

		public override init()                  { super.init()
			max_quantity                 = 10
			type                         = e_item_type.battle
		}
	}
;

public class
	Key : Item {
		var
		found_during                 = "scene 0"     ,
		needed_during                = "scene 0"     ,
		acquire_effects              = ["HP": 0]
		;

		override init()                  { super.init()
			max_quantity                 = 1
			type                         = e_item_type.key
			price                        = nil
		}
	}
;

public func equip  ( which: Character, with this: Item  ) {}
public func use    ( a: Item, on this: Character ) {}
public func obtain ( which:Character, gets this: Item   ) {}