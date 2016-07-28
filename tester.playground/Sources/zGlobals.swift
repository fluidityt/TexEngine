import Foundation

public var
	Eidye = eidye(),
	narrator = Character(),
	Mris = mris(),
	Bug = enemy();

public class enemy {
	public var hp = 50
	public var ap = 20

	func squeal()
	{
		print(self.hp)
	}
	public init(){}
}