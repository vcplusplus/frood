//
//  Event.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import UIKit
import Gloss

let testJSON = [
    "id" : "1234abcd",
    "name" : "test",
    "description" : "descriptionTest",
    "location": "testLocation",
    "host" : "testHost",
    "start" :"test start time",
    "end" : "test end time",
    "reports" : 0,
    "hearts" : 0,
    "tags" : ["tag1", "tag2"]
]

struct Event:Decodable {
    
    var id:String?
    var name:String?
    var description:String?
    var location:String?
    var host:String?
    var start:String?
    var end:String?
    var reports:Int?
    var hearts:Int?
    var tags:[String]?
    var image:UIImage?
    
    
//    init() {
//        // Will be dynamic later....
//        title = "CommunityHack"
//        description = "A hackathon for all of your friends! No coding experience needed!!!! Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. TAGS: -- -- --- --- PIZZA"
//        start = "7:00pm Feb. 5th"
//        end = "7:00pm Feb. 6th"
//        location = "Location: Sanders Physics"
//        foodImage = UIImage(named: "foodImagePlaceholder")!
//    }
    
//    init(title:String, start:String, end:String, location:String, description:String, foodImage:UIImage) {
//        self.title = title
//        self.start = start
//        self.end = end
//        self.location = location
//        self.description = description
//        self.foodImage = foodImage
//    }
    
    
     init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.location = "location" <~~ json
        self.host = "host" <~~ json
        self.start = "start" <~~ json
        self.end = "end" <~~ json
        self.reports = "reports" <~~ json
        self.hearts = "hearts" <~~ json
        self.tags = "tags" <~~ json
        
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