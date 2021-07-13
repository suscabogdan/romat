//
//  AppDelegate.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 31/01/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds
import Firebase
import IQKeyboardManager

var checkIfRoMatIdPaid:Bool = true

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var verificaLoggare:Bool = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GADMobileAds.configure(withApplicationID: "ca-app-pub-9281407659455784~3230069350")
        FirebaseApp.configure()
        
        return true
    }
    
    func verificaInregistrareNula() -> Bool
    {
        let verificare = UserDefaults.standard
        if verificare.value(forKey: "verificareLogare") != nil
        {
            return false
        }
        else
        {
            return true
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

