//
//  UIImage.swift
//  SKExtensions
//
//  Created by Angelo Yu on 2/20/16.
//  Copyright © 2016 Snowkite. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {

    // fit into square area with white background
    // TODO, make background color an input
    func fitSquare(length:CGFloat) -> UIImage? {
        let ratio = length / (self.size.width > self.size.height ? self.size.width : self.size.height)
        let imageSize = CGSizeMake(self.size.width * ratio, self.size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(length, length), false, UIScreen.mainScreen().scale)
        self.drawInRect(CGRectMake((length - imageSize.width) / 2, (length - imageSize.height) / 2, imageSize.width, imageSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
