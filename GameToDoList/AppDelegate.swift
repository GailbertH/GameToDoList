//
//  AppDelegate.swift
//  GameToDoList
//
//  Created by Gailbert Huang on 6/20/23.
//

import UIKit
import CoreData
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "No Realm file")
        do{
            _ = try Realm()
        }
        catch
        {
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }
}

