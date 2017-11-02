//
//  UINavigationController+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/9/22.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func popTo(_ viewContrllerClass:AnyClass){
        let VC:UIViewController? = self.viewControllers.filter({$0.classForCoder == viewContrllerClass}).first
        guard VC != nil else {
            return
        }
        popToViewController(VC!, animated: true)
    }
}
