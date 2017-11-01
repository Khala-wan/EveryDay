//
//  UIColor+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/7/24.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    static var hzfGreen:UIColor{
        get{
            return UIColor.getColor("00acb9")
        }
    }
    
    static var hzfGray666:UIColor{
        get{
            return UIColor.getColor("666666")
        }
    }
}

extension UIColor{
    class func getColor(_ hexString:String) -> UIColor {
        var cString = hexString.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = cString.substring(from: index)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
