//
//  GS_Utilities.swift
//  g2
//
//  Created by Dude Guy on 8/8/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
public struct This_block {
	public enum debugged {
		case off
	}

	public init(_ description:String ,_ code: ())		{	}

	public init(_ kay:debugged, _ description:String ,_ code: ()->())		{}


}



public func toggle(inout variable:Bool)
{
	if variable == true { variable = false }
	else { variable = true }
}



/**
SINCE CALLOUTS ARE FUCKED
*/
public struct DELETEME {
	public init(){}
}
