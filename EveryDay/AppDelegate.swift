//
//  AppDelegate.swift
//  EveryDay
//
//  Created by 万圣 on 2017/11/1.
//  Copyright © 2017年 万圣. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame:UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white
        windowInit()
        window?.makeKeyAndVisible();
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
//MARK: ---- Window Init
extension AppDelegate{
    
    fileprivate final func windowInit(){
        window?.backgroundColor = UIColor.white
        if UserModel.shared().userID != nil {
            let tabBarVC = getTabBarVC()
            window?.rootViewController = tabBarVC
        }else{
            window?.rootViewController = LogInViewController()
        }
        window?.makeKeyAndVisible();
    }
    
    //MARK:配置window
    ///
    /// - Returns: tabBarVC
    fileprivate final func getTabBarVC()->UITabBarController{
        let baseTab:BaseTabBarViewController = BaseTabBarViewController()
        //首页
        let findHouseVC:MainViewController = MainViewController()
        let childFH:UINavigationController = UINavigationController.init(rootViewController:findHouseVC)
        self.setUpTabbarItemWith(childFH, title: "", image_N: "tab_Main", image_S: "tab_Main_选中")
        baseTab.addChildViewController(childFH)
        
        //日历
        let calenderVC:CalenderViewController = CalenderViewController()
        let childCL:UINavigationController = UINavigationController.init(rootViewController:calenderVC)
        self.setUpTabbarItemWith(childCL, title: "", image_N: "tab_Calender", image_S: "tab_Calender_选中")
        baseTab.addChildViewController(childCL)
        
        let addVc:UIViewController = UIViewController()
        self.setUpTabbarItemWith(addVc, title: "", image_N: "tab_Add", image_S: "tab_Add_选中",insert: UIEdgeInsets(top: -20, left: 0, bottom: -7, right: 0))
        baseTab.addChildViewController(addVc)
        
        //圈子
        let circleAroundVC:MainViewController = MainViewController()
        let childCA:UINavigationController = UINavigationController.init(rootViewController:circleAroundVC)
        self.setUpTabbarItemWith(childCA, title: "", image_N: "tab_CircleAround", image_S: "tab_CircleAround_选中")
        baseTab.addChildViewController(childCA)
        
        //个人中心
        let personCenterVC:MainViewController = MainViewController()
        let childPC:UINavigationController = UINavigationController.init(rootViewController:personCenterVC)
        self.setUpTabbarItemWith(childPC, title: "", image_N: "tab_PersonCenter", image_S: "tab_PersonCenter_选中")
        baseTab.addChildViewController(childPC)
        
        baseTab.tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.getColor("00b4c3")
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .compact)
        UINavigationBar.appearance().shadowImage = UIImage()
        return baseTab
    }
    
    
    //MARK:配置tabbaritem
    fileprivate final func setUpTabbarItemWith(_ VC:UIViewController,title:String,image_N:String,image_S:String,insert:UIEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)){
        
        let imageN:UIImage = UIImage.init(named: image_N) ?? UIImage()
        let imageS:UIImage = UIImage.init(named: image_S) ?? UIImage()
        
        VC.tabBarItem.title = title
        VC.tabBarItem.image = imageN.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        VC.tabBarItem.selectedImage = imageS.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        VC.tabBarItem.imageInsets = insert
    }
}

