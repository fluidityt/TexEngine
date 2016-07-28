import Foundation

public func log(s:String) { print("\nLOG: " + s + "\n") }

public func remember(s:String) { print("\nREMEMBER: " + s + "\n") }

public let newLine = {print("\n")}

     //  pram only if a toon is talking :)
	// FIXME: fix the default to narrator
  public  func mwin(s:String, said this:Character ){
        // we don't want to print labels only for toons
        this.name != "narrator"
        ?
            print(this.name + ": " + s)
        :
            print(s)
        
    };