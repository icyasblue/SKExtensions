//
//  UIColor.swift
//  SKExtensions
//
//  Created by Angelo Yu on 12/11/15.
//  Copyright © 2015 Snowkite. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    // init with "[#]RGB", "[#]RRGGBB", "[#]RRRGGGBBB"...
    // "#" is optional
    public convenience init(rgbString:String) {
        let str = removePound(rgbString)
        let length = str.characters.count
        if length % 3 == 0 {
            if let rgb = hex2CGFloatArray(str, by: length / 3) {
                self.init(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1)
                return
            }
        }
        self.init(CGColor: UIColor.clearColor().CGColor)
    }

    // init with "[#]RGBA", "[#]RRGGBBAA", "[#]RRRGGGBBBAAA"...
    // "#" is optional
    public convenience init(rgbaString:String) {
        let str = removePound(rgbaString)
        let length = str.characters.count
        if length % 4 == 0 {
            if let rgba = hex2CGFloatArray(str, by: length / 4) {
                self.init(red: rgba[0], green: rgba[1], blue: rgba[2], alpha:rgba[3])
                return
            }
        }
        self.init(CGColor: UIColor.clearColor().CGColor)
    }
}

// MARK: - private functions

private func removePound(s:String) -> String {
    if s.hasPrefix("#") {
        return s.substringFromIndex(s.startIndex.advancedBy(1))
    }
    return s
}

private func hex2CGFloatArray(hexString:String, by:Int) -> [CGFloat]? {
    if let num = Int(hexString, radix: 16) {
        let step = by * 4
        var resultArray = [CGFloat]()
        var mask = Int(pow(16, Double(by)) - 1)
        var i = 1
        while i <= num {
            resultArray.insert(CGFloat(num & mask) / CGFloat(mask), atIndex: 0)
            i <<= step
            mask <<= step
        }
        return resultArray
    }
    return nil
}
