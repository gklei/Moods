//
//  Mood.swift
//  Moods
//
//  Created by Gregory Klein on 12/2/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation
import UIKit

public final class Mood: ManagedObject
{
   @NSManaged public private(set) var date: NSDate
   @NSManaged public private(set) var colors: [UIColor]
}
