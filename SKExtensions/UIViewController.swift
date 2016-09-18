//
//  UIViewController.swift
//  SKExtensions
//
//  Created by Angelo Yu on 2/12/16.
//  Copyright © 2016 Snowkite. All rights reserved.
//

import Foundation
import UIKit

let ACTIVITY_INDICATOR_TAG = 1024

extension UIViewController {

    func startLoader(_ style:UIActivityIndicatorViewStyle = .gray, center:CGPoint? = nil, ignoreInteraction:Bool = true) {
        DispatchQueue.main.async { () -> Void in
            let loaderCenter = center ?? self.view.center
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            activityIndicator.center = loaderCenter
            activityIndicator.hidesWhenStopped = true
            activityIndicator.tag = ACTIVITY_INDICATOR_TAG
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            if ignoreInteraction {
                UIApplication.shared.beginIgnoringInteractionEvents()
            }
        }
    }

    func stopLoader() {
        DispatchQueue.main.async { () -> Void in
            UIApplication.shared.endIgnoringInteractionEvents()
            for subview in self.view.subviews {
                if ACTIVITY_INDICATOR_TAG == subview.tag {
                    if let activityIndicator = subview as? UIActivityIndicatorView {
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                    }
                }
            }
        }
    }
}
