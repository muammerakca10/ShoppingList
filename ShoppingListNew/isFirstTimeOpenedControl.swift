//
//  isFirstTimeOpenedControl.swift
//  ShoppingListNew
//
//  Created by MAC on 13.10.2022.
//

import Foundation
import UIKit

extension UIApplication {
        class func isFirstLaunch() -> Bool {
            if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") {
                UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
                UserDefaults.standard.synchronize()
                return true
            }
            return false
        }
    }
