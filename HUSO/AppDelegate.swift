//
//  AppDelegate.swift
//  HUSO
//
//  Created by Asher Noel on 7/25/19.
//  Copyright © 2019 Asher Noel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        UITabBar.appearance().tintColor = UIColor(red: 237.0/255, green: 27.0/255, blue: 52.0/255, alpha: 1)

        // Add code here (e.g. if/else) to determine which view controller class (chooseViewControllerA or chooseViewControllerB) and storyboard ID (chooseStoryboardA or chooseStoryboardB) to send the user to

        
        let SetupViewController = self.window?.rootViewController as? SetupViewController

        
        
        if(SetupViewController?.selectedDivision == nil)
        {
            let initialViewController: SetupViewController = mainStoryboard.instantiateViewController(withIdentifier: "setupForm") as! SetupViewController
            self.window?.rootViewController = initialViewController
        }
        else
        {
            let initialViewController: ScheduleViewController = mainStoryboard.instantiateViewController(withIdentifier: "scheduleList") as! ScheduleViewController
            self.window?.rootViewController = initialViewController
        }

        self.window?.makeKeyAndVisible()

        return true
    }
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
//    {
//        // Override point for customization after application launch.
//        return true
//    }

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

    private func loadCompetitor() -> Competitor?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Competitor.ArchiveURL.path) as? Competitor
    }

}

