//
//  String+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/8/4.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit

//MARK:宽度
extension String {
    
    func width(_ fontSize:CGFloat)->CGFloat{
        let str:NSString = self as NSString
        let size:CGSize = str.size(withAttributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize)])
        return size.width
    }
    
    func height(_ fontSize:CGFloat,_ width:CGFloat)->CGFloat{
        let str:NSString = self as NSString
        let size:CGSize = str.boundingRect(with: CGSize(width: width - 20, height: 1000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize)], context: nil).size
        return size.height
    }
}

