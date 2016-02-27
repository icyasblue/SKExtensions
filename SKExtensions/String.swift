//
//  String.swift
//  SKExtensions
//
//  Created by Angelo Yu on 12/11/15.
//  Copyright © 2015 Snowkite. All rights reserved.
//

import Foundation

extension String {

    func contains(aString: String) -> Bool {
        return self.lowercaseString.rangeOfString(aString.lowercaseString) != nil
    }

    static func randomString(stringLength:Int) -> String {
        // for url safety, use only letter and numbers
        let CHAR_SET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let SET_SIZE = UInt32(CHAR_SET.characters.count)
        var str = ""
        guard stringLength > 0 else {
            return str
        }
        for _ in 0..<stringLength {
            str +=  "\(CHAR_SET[CHAR_SET.startIndex.advancedBy(Int(arc4random_uniform(SET_SIZE)))])"
        }
        return str
    }

    // new lines included
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}
