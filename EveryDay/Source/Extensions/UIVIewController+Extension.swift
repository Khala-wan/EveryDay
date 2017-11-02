//
//  UIVIewController+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/8/9.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import UIKit

enum navigationItemType{
    case left
    case right
}

extension UIViewController{
    
    func setBarButtonItem(imgName:String,selector:Selector,type:navigationItemType){
        
        let btn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        btn.contentMode = type == .left ? .left : .right
        btn.setImage(UIImage(named: imgName), for: .normal)
        btn.addTarget(self, action: selector, for: .touchUpInside)
        let item:UIBarButtonItem = UIBarButtonItem.init(customView: btn)
        if type == .left{
            self.navigationItem.leftBarButtonItem = item
        }else{
            self.navigationItem.rightBarButtonItem = item
        }
    }
    
    func setBarButtonItem(title:String,selector:Selector,type:navigationItemType){
        
        let btn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: title.width(14), height: 44))
        btn.contentMode = type == .left ? .left : .right
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.getColor("333333"), for: .normal)
        btn.addTarget(self, action: selector, for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        let item:UIBarButtonItem = UIBarButtonItem.init(customView: btn)
        if type == .left{
            self.navigationItem.leftBarButtonItem = item
        }else{
            self.navigationItem.rightBarButtonItem = item
        }
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
