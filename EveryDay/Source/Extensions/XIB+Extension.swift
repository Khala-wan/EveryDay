//
//  XIB+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/7/24.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    @IBInspectable var cornerRadius:CGFloat{
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        set{
            layer.borderWidth = newValue
            layer.masksToBounds = true
        }
        
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        set{
            layer.borderColor = newValue.cgColor
            layer.masksToBounds = true
        }
        
        get{
            return UIColor.init(cgColor: layer.borderColor!)
        }
    }
}
