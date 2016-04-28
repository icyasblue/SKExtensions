//
//  NSDate.swift
//  SKExtensions
//
//  Created by Angelo Yu on 4/5/16.
//  Copyright © 2016 Snowkite. All rights reserved.
//

import Foundation

extension NSDate {

    func shiftByMonths(months:Int) -> NSDate? {
        return NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: months, toDate: self, options: NSCalendarOptions.MatchFirst)
    }

    func shiftByDays(days:Int) -> NSDate? {
        return NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: days, toDate: self, options: NSCalendarOptions.MatchFirst)
    }

    func shiftByHours(hours:Int) -> NSDate? {
        return NSCalendar.currentCalendar().dateByAddingUnit(.Hour, value: hours, toDate: self, options: NSCalendarOptions.MatchFirst)
    }

    // comparison C style
    @warn_unused_result
    func sk_compare(another: NSDate) -> Int {
        let res = self.compare(another)
        switch res {
        case .OrderedSame:
            return 0
        case .OrderedAscending:
            return -1
        case .OrderedDescending:
            return 1
        }
    }
}