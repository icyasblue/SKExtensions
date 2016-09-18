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
    func fitSquare(_ length:CGFloat) -> UIImage? {
        let ratio = length / (self.size.width > self.size.height ? self.size.width : self.size.height)
        let imageSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: length, height: length), false, UIScreen.main.scale)
        self.draw(in: CGRect(x: (length - imageSize.width) / 2, y: (length - imageSize.height) / 2, width: imageSize.width, height: imageSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
