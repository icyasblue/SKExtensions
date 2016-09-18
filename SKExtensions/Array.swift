//
//  Array.swift
//  SKExtensions
//
//  Created by Angelo Yu on 12/11/15.
//  Copyright © 2015 Snowkite. All rights reserved.
//

import Foundation

extension Array {
    // javascript-like filter function

    func sk_filter(fn: (_ item:Element, _ idx:Int, _ arr:[Element]) throws -> Bool) rethrows -> [Element] {
        var returnArray = [Element]()
        for (i, x) in self.enumerated() {
            if try fn(x, i, self) {
                returnArray.append(x)
            }
        }
        return returnArray
    }

    // javascript-like map function

    func sk_map<T>(fn: (_ item:Element, _ idx:Int, _ arr:[Element]) throws -> T) rethrows -> [T] {
        var returnArray = [T]()
        for (i, x) in self.enumerated() {
            returnArray.append(try fn(x, i, self))
        }
        return returnArray
    }

    // return item at random index, nil if array is empty
    func sk_randomItem() -> Element? {
        if count > 0 {
            return self[Int(arc4random_uniform(UInt32(count)))]
        }
        return nil
    }

    // split array into array of fixed length arrays, nil if can't equally divide
    func sk_split(_ length:Int) -> [[Element]]? {
        if 0 == count % length {
            var result = [[Element]]()
            var i = 0
            while i < count {
                result.append(Array(self[i...(i + length - 1)]))
                i += length
            }
            return result
        }
        return nil
    }

    // extending join to all types with their string representation
    func sk_join(_ separator:String) -> String {
        return self.map({ String(describing: $0) }).joined(separator: separator)
    }
}
