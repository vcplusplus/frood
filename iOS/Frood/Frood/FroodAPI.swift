//
//  FroodAPI.swift
//  Frood
//
//  Created by Jayce Rudig-Leathers on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import Gloss
import Alamofire


class FroodAPI {
    
    let serverURL:String
    
    init(serverURL:String) {
        self.serverURL = serverURL
    }
    
    func getAllEvents(callback: (events:[Event]?, error:String?) -> Void ) {
//        var events:[Event]?
        
        Alamofire.request(.GET, serverURL + "/api/events")
            .responseJSON { response in
                switch response.result {
                case .Success(let json):
                    print("Success with JSON: \(json)")
                    
                    let response = json as! [NSDictionary]
                    
                    //example if there is an id
                    let events = Event.modelsFromJSONArray(response as! [JSON])
                    callback(events: events,error:nil)
                    
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                    callback(events:nil,error:"error")
                }
        }
       
//        return events
    }
    
    func addEvent(event:Event) {
        Alamofire.request(.POST, serverURL + "/api/events/",parameters: event.toJSON())
    }
}
