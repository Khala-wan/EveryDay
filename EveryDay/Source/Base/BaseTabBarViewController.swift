//
//  BaseTabBarViewController.swift
//  EveryDay
//
//  Created by 万圣 on 2017/11/1.
//  Copyright © 2017年 万圣. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

//MARK: ---- lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbar()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: ---- public Method

//MARK: ---- event response

//MARK: ---- private method
    fileprivate final func setUpTabbar() {
        tabBar.backgroundColor = UIColor.white
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        drawShadow(offset: CGSize(width: 0, height: 0), radius: 3, color: UIColor.black, opacity: 0.1)
    }
    
    /// 绘制阴影
    ///
    /// - Parameters:
    ///   - offset: 偏移
    ///   - radius: 半径
    ///   - color: 颜色
    ///   - opacity: 不透明度
    fileprivate final func drawShadow(offset:CGSize,radius:CGFloat,color:UIColor,opacity:Float){
        
        let path:CGMutablePath = CGMutablePath()
        path.addRect(tabBar.bounds)
        tabBar.layer.shadowPath = path
        path.closeSubpath()
        tabBar.layer.backgroundColor = UIColor.white.cgColor
        tabBar.layer.shadowColor = color.cgColor
        tabBar.layer.shadowOffset = offset
        tabBar.layer.shadowRadius = radius
        tabBar.layer.shadowOpacity = opacity
        tabBar.clipsToBounds = false
    }
//MARK: ---- getter && setter

}
