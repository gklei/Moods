//
//  AppDelegate.swift
//  Moods
//
//  Created by Gregory Klein on 12/2/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
   var window: UIWindow?
   var managedObjectContext: NSManagedObjectContext!

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
   {
      managedObjectContext = createMoodsMainContext()
      return true
   }
}

