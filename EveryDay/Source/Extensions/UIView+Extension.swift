//
//  UIView+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/8/4.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static func getFrom(xib:String)->UIView{
        return Bundle.main.loadNibNamed(xib, owner: nil, options: nil)?.last as? UIView ?? UIView()
    }
    
    var height:CGFloat{
        get{
            return bounds.size.height
        }
        set{
            bounds.size.height = newValue
        }
    }
    
    var width:CGFloat{
        get{
            return bounds.size.width
        }
        set{
            bounds.size.width = newValue
        }
    }
    
    var x:CGFloat{
        get{
            return frame.origin.x
        }
        set{
            frame.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return frame.origin.y
        }
        set{
            frame.origin.y = newValue
        }
    }
    
    func removeAllSubViews(){
        for view in self.subviews{
            view.removeFromSuperview()
        }
    }
    
    enum borderType {
        case left
        case right
        case top
        case bottom
    }
    
    //MARK: ---- border
    func strokeBorder(_ color:UIColor,type:borderType){
        let layer:CAShapeLayer = CAShapeLayer()
        layer.frame = self.bounds
        layer.strokeColor = color.cgColor
        layer.lineWidth = 0.5
        let path:UIBezierPath = UIBezierPath()
        var begin:CGPoint!
        var end:CGPoint!
        let width:CGFloat = self.width == 0 ? ScreenWidth : self.width
        switch type {
        case .top:
            begin = CGPoint(x: 0, y: 0)
            end = CGPoint(x: width, y: 0)
        case .left:
            begin = CGPoint(x: 0, y: 0)
            end = CGPoint(x: 0, y: height)
        case .right:
            begin = CGPoint(x: width, y: 0)
            end = CGPoint(x: width, y: height)
        case .bottom:
            begin = CGPoint(x: 0, y: height)
            end = CGPoint(x: width, y: height)
        }
        path.move(to: begin)
        path.addLine(to: end)
        path.stroke()
        layer.path = path.cgPath
        self.layer.insertSublayer(layer, at: 0)
    }
    
    //MARK:snapShot
    func snapShot()->UIImage?{
        UIGraphicsBeginImageContextWithOptions(bounds.size, self.isOpaque, 0.0)
        if let context = UIGraphicsGetCurrentContext(){
            layer.render(in: context)
            let img:UIImage? = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return img
        }
        return nil
        
    }
}
