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
    @warn_unused_result
    func sk_filter(fn: (item:Element, idx:Int, arr:[Element]) throws -> Bool) rethrows -> [Element] {
        var returnArray = [Element]()
        for (i, x) in self.enumerate() {
            if try fn(item:x, idx: i, arr: self) {
                returnArray.append(x)
            }
        }
        return returnArray
    }

    // javascript-like map function
    @warn_unused_result
    func sk_map<T>(fn: (item:Element, idx:Int, arr:[Element]) throws -> T) rethrows -> [T] {
        var returnArray = [T]()
        for (i, x) in self.enumerate() {
            returnArray.append(try fn(item:x, idx: i, arr: self))
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
    func sk_split(length:Int) -> [[Element]]? {
        if 0 == count % length {
            var result = [[Element]]()
            for var i = 0; i < count; i += length {
                result.append(Array(self[i...(i + length - 1)]))
            }
            return result
        }
        return nil
    }

    // extending join to all types with their string representation
    func sk_join(separator:String) -> String {
        return self.map({ String($0) }).joinWithSeparator(separator)
    }
}
