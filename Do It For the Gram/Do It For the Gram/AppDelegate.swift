//
//  AppDelegate.swift
//  Do It For the Gram
//
//  Created by Matt on 3/6/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize Parse
        // Set applicationId and server based on the values in the Heroku settings.
        // clientKey is not used on Parse open source unless explicitly configured
        Parse.initializeWithConfiguration(
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "Do It For the Gram"
                configuration.clientKey = "z0VPWWFj6Jnq"
                configuration.server = "https://dry-atoll-61865.herokuapp.com/parse"
            })
    )
        
        //check if there's a currently logged in user
        if PFUser.currentUser() != nil{
            //segue to the main screen 
            print("There is a current user!")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("feedTabController")
            //set the feed controller to the main controller
            window?.rootViewController = vc
        }else{
            print("there is no currently logged in user")
        }
        
        //check for the logout
        NSNotificationCenter.defaultCenter().addObserverForName("UserDidLogout", object: nil, queue: NSOperationQueue.mainQueue()) { (NSNotification) -> Void in
            //load the info for the current user and bypass authorization
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let viewController = storyboard.instantiateInitialViewController()
            
            //set the view controller back to the main view controller
            self.window?.rootViewController = viewController
            
        }
        
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

