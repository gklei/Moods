//
//  MoodsStack.swift
//  Moods
//
//  Created by Gregory Klein on 12/3/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import CoreData

extension NSURL
{
   static func temporaryURL() -> NSURL
   {
      return try! NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.CachesDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true).URLByAppendingPathComponent(NSUUID().UUIDString)
   }
   
   static var documentsURL: NSURL
   {
      return try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
   }
}

private let _storeURL = NSURL.documentsURL.URLByAppendingPathComponent("Moods.moods")

public func createMoodsMainContext() -> NSManagedObjectContext
{
   let bundles = [NSBundle(forClass: Mood.self)]
   guard let model = NSManagedObjectModel.mergedModelFromBundles(bundles) else {
      fatalError("model not found")
   }
   
   let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
   
   // if this throws an error, there's not feasible way to recover from this right now, so we can use try!
   try! psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: _storeURL, options: nil)
   
   let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
   context.persistentStoreCoordinator = psc
   
   return context
}
