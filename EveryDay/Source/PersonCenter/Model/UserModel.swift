//
//  UserModel.swift
//  会找房
//
//  Created by 万圣 on 2017/8/5.
//  Copyright © 2017年 会分期. All rights reserved.
//

import Foundation
import CoreLocation
import RxMoya
import RxSwift

class UserModel:NSObject {
    
    //MARK:定位
    var location:CLLocation?
    //MARK:定位的城市
    var locationCity:String?
    
    var userID:String?
    
    //sourceid
    var shareSDKSource:String?
    
    //分享id
    var shareSDKID:String?
    
    var shareNickName:String?

    fileprivate static let model:UserModel = initModel()
    
    class func shared() -> UserModel {
        return model
    }
    
    class fileprivate func initModel() -> UserModel{
        let model:UserModel = UserModel()
        return model
    }
}
