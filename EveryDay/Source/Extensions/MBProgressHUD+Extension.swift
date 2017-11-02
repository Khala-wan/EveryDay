//
//  MBProgressHUD+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/9/8.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import MBProgressHUD

extension MBProgressHUD {
    static func show(){
        if let view:UIView = UIApplication.shared.keyWindow?.rootViewController?.view{
            MBProgressHUD.showAdded(to: view, animated: true)
        }
    }
    
    static func hide(){
        if let view:UIView = UIApplication.shared.keyWindow?.rootViewController?.view{
            MBProgressHUD.hideAllHUDs(for: view, animated: true)
        }
    }
}
