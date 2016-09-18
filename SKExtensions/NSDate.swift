//
//  NSDate.swift
//  SKExtensions
//
//  Created by Angelo Yu on 4/5/16.
//  Copyright © 2016 Snowkite. All rights reserved.
//

import Foundation

extension Date {

    func shiftByMonths(_ months:Int) -> Date? {
        return (Calendar.current as NSCalendar).date(byAdding: .month, value: months, to: self, options: NSCalendar.Options.matchFirst)
    }

    func shiftByDays(_ days:Int) -> Date? {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: days, to: self, options: NSCalendar.Options.matchFirst)
    }

    func shiftByHours(_ hours:Int) -> Date? {
        return (Calendar.current as NSCalendar).date(byAdding: .hour, value: hours, to: self, options: NSCalendar.Options.matchFirst)
    }

    // comparison C style

    func sk_compare(_ another: Date) -> Int {
        let res = self.compare(another)
        switch res {
        case .orderedSame:
            return 0
        case .orderedAscending:
            return -1
        case .orderedDescending:
            return 1
        }
    }
}
