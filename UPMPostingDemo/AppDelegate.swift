//
//  AppDelegate.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/5/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        /* Parse initialization */
        Parse.setApplicationId("6ZVQsgQNW5KpO6H5os6JxGOxZAFCEdfLua2T3PAm",
            clientKey: "5bsP9MYcxGGU1bZkKC2ovgySNyLkCk5223irCGG0")
        
        var defaultACL = PFACL.ACL()
        // If you would like all objects to be private by default, remove this line.
        defaultACL.setPublicReadAccess(true)
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
        
        /* Tab Bar Appearance */
        var tabBarController = self.window?.rootViewController as UITabBarController
        var tabBar = tabBarController.tabBar
        if let items = tabBar.items as? [UITabBarItem] {
            var newListingsTabBarItem = items[0]
            newListingsTabBarItem.image = UIImage(named: "new.png").imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            newListingsTabBarItem.selectedImage = UIImage(named: "newSelected.png").imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
        }
      
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightPurpleColor()], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.darkPurpleColor()], forState:.Selected)



         /* Parse Notifictions */
//        var userNotificationTypes: UIUserNotificationType = (UIUserNotificationType.Alert |
//            UIUserNotificationType.Badge |
//            UIUserNotificationType.Sound)
//        var settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
//        
       

        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

