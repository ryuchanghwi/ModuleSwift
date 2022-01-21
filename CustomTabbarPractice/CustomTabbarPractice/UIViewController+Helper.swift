//
//  UIViewController+Helper.swift
//  CustomTabbarPractice
//
//  Created by 류창휘 on 2022/01/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    var rootVC: RootStackTabViewController? {
        var selfVC = self
        while let parentVC = selfVC.parent {
            if let vc = parentVC as? RootStackTabViewController {
                return vc
            } else {
                selfVC = parentVC
            }
        }
        return nil
    }
    
}
