//
//  AppDelegate.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if UniversityModel.sharedIntstance.savedUniversityDic()
        {
            print("Items need to be created, off you go savedUniversityDic() ")
        } else  {
            UniversityModel.sharedIntstance.createUniversityArray() // this creates all the objects again
        }
        getDayOfWeek()
        
//        let day = getDayOfWeek()
//        print("DAY: \(day)")
        
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
    
    //MARK: Time/Reset Methods
    /**
     Method that returns the day of the week as an optional Int, sunday = 1 ... satruday = 7
     - returns: Optional Int
     */
    func getDayOfWeek()->Int? {
        let weekday = NSCalendar.current.component(.weekday, from: Date())
        switch (weekday) {
        case 2:
            print("Monday Found - Reset Scores Process")
           _ = reset
            
        default: print("Not a Weekday we care about: No Reset necessary")
        }
        return weekday
    }
    
    
    /**
     This closure that only runs once to ensure that teh reset mechainc only happens once on the day and only on that day
     */
    private lazy var reset: Void = {
        // Do this once
        print("Run this method once")
        UniversityModel.sharedIntstance.resetRatingCheckedAndTimestamp()
    }()
    
    
    func startOfDate() -> Date {
        let date = Date()
        let cal = Calendar(identifier: .gregorian)
        let midnightDate = cal.startOfDay(for: date)
        print("\(midnightDate)")
        
        return midnightDate
    }

}

