//
//  Toast+Extension.swift
//  会找房
//
//  Created by 万圣 on 2017/8/25.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import Toaster

extension Toast{
    static func show(_ text:String){
        guard ToastCenter.default.currentToast?.text != text else {
            return
        }
        let t:Toast = Toast.init(text: text, delay: 0, duration: 2)
        t.view.bottomOffsetPortrait = (ScreenHeight - 64) * 0.5
        t.view.font = UIFont.systemFont(ofSize: 14.0)
        t.show()
    }
}
