//
//  UIButton+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/8/3.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func vertiaclBtn(imageName:String,title:String,spacing:CGFloat,frame:CGRect,font:UIFont){
        var newFrame = frame
        newFrame.size.width *= 2
        self.frame = newFrame
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.titleEdgeInsets = UIEdgeInsets(top: self.imageView!.frame.size.height + spacing, left: -self.imageView!.frame.size.width, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: -self.titleLabel!.bounds.size.height, left: 0, bottom: 0, right: -self.titleLabel!.bounds.size.width)
        self.frame = frame
    }
    
    func leftTitleBtn(imageName:String,title:String,spacing:CGFloat,frame:CGRect,font:UIFont){
        var newFrame = frame
        newFrame.size.width *= 2
        self.frame = newFrame
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -self.imageView!.frame.size.width * 2.0 - spacing, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -self.titleLabel!.bounds.size.width * 2.0)
        self.frame = frame
    }
    
    func rightTitleBtn(imageName:String,title:String,spacing:CGFloat,frame:CGRect,font:UIFont){
        var newFrame = frame
        newFrame.size.width *= 2
        self.frame = newFrame
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.imageView!.frame.size.width * 2.0 + spacing, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.titleLabel!.bounds.size.width * 2.0)
        self.frame = frame
    }
    
    func centerBtn(imageName:String,title:String,spacing:CGFloat,frame:CGRect,font:UIFont){
        var newFrame = frame
        newFrame.size.width *= 2
        self.frame = newFrame
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -self.imageView!.frame.size.width, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -self.titleLabel!.bounds.size.width)
        self.contentMode = .scaleAspectFill
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.frame = frame
    }
}
