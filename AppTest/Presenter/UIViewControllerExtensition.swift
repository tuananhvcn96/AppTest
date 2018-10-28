//
//  UIViewControllerExtensition.swift
//  AppTest
//
//  Created by Tuan Anh on 10/27/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import UIKit

func classDomain<T>(_ object: T.Type) -> String {
    return String(describing: object)
}

extension UIViewController {
    
    class func controller<T: UIViewController>(from storyboard: String, storyboardID: String? = nil) -> T {
        // swiftlint:disable force_cast
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        if let identifier = storyboardID {
            return storyboard.instantiateViewController(withIdentifier: identifier) as! T
        }
        return storyboard.instantiateViewController(withIdentifier:classDomain(T.self)) as! T
    }
}
