//
//  AppDelegate.swift
//  EnlaceCatolico IP
//
//  Created by Jose Matus on 14/06/14.
//  Copyright (c) 2014 annwynsoft. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.whiteColor()
        
        
        let tableViewController = AINewsTableViewController()
        let navigationController = UINavigationController(rootViewController: tableViewController);
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [navigationController]
        self.window!.rootViewController = splitViewController;
        
        // Navigation bar customization.
        //Set the Navigation bar Font Color to  cardinal Red
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "Georgia", size: 18.0),
            NSForegroundColorAttributeName: UIColor(red: 140/255, green: 21/255, blue: 21/255, alpha: 1.0)
            
           // NSForegroundColorAttributeName: UIColor(red: 140, green: 21, blue: 21, alpha: 1)
            
        ]
        
        
        // Set the navigation Bar Tint Color to Cardinal Red
        navigationController.navigationBar.tintColor = UIColor(red: 140/255, green: 21/255, blue: 21/255, alpha: 1)
        
        
        
        
        self.window!.makeKeyAndVisible()
        return true
    }
    
}

