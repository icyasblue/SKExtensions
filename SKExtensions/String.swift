//
//  String.swift
//  SKExtensions
//
//  Created by Angelo Yu on 12/11/15.
//  Copyright © 2015 Snowkite. All rights reserved.
//

import Foundation

extension String {

    func contains(_ aString: String) -> Bool {
        return self.lowercased().range(of: aString.lowercased()) != nil
    }

    static func randomString(_ stringLength:Int) -> String {
        // for url safety, use only letter and numbers
        let CHAR_SET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let SET_SIZE = UInt32(CHAR_SET.characters.count)
        var str = ""
        guard stringLength > 0 else {
            return str
        }
        for _ in 0..<stringLength {
            str +=  "\(CHAR_SET[CHAR_SET.characters.index(CHAR_SET.startIndex, offsetBy: Int(arc4random_uniform(SET_SIZE)))])"
        }
        return str
    }

    // new lines included
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
