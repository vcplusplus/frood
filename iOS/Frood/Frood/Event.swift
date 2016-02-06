//
//  Event.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import UIKit

class Event {
    var title:String
    var description:String
    var start:String
    var end:String
    var location:String
    var foodImage:UIImage
    
    init() {
        // Will be dynamic later....
        title = "CommunityHack"
        description = "A hackathon for all of your friends! No coding experience needed!!!! Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. TAGS: -- -- --- --- PIZZA"
        start = "7:00pm Feb. 5th"
        end = "7:00pm Feb. 6th"
        location = "Location: Sanders Physics"
        foodImage = UIImage(named: "foodImagePlaceholder")!
    }
    
    /// somekind of requests
   // @NSManaged var longitude: Double
   // @NSManaged var latitude: Double
    
 //   override class func initialize() {
 //       struct Static {
 //           static var onceToken : dispatch_once_t = 0;
 //       }
 //       dispatch_once(&Static.onceToken) {
 //           self.registerSubclass()
 //       }
 //   }
    
 //  static func parseClassName() -> String {
 //       return "Event"
 //   }
}