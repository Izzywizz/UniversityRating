//
//  AppDelegate.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit
import Flurry_iOS_SDK 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let time = Time()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Flurry Integration
        Flurry.setLogLevel(FlurryLogLevelAll)
        Flurry.startSession("N46H6KFRKX2P4TCMTRBB");

        if UniversityModel.sharedIntstance.savedUniversityDic()
        {
            print("Items need to be created, savedUniversityDic() called")
        } else  {
            UniversityModel.sharedIntstance.createUniversityArray() // this creates all the objects again
        }
        let _ = time.getDayOfWeek()
        
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
        let hasFeedbackBeenRecieved = UserDefaults.standard.bool(forKey: "feedbackSubmitted")
        if hasFeedbackBeenRecieved {
            let _ = time.getDayOfWeek()
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

//        if !UserDefaults.standard.bool(forKey: "feedbackSubmitted") {
//            let navigationController = application.windows[0].rootViewController as! UINavigationController
//            navigationController.popViewController(animated: true)
//        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    

    
    
}

