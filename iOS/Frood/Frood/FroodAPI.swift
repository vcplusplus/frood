//
//  FroodAPI.swift
//  Frood
//
//  Created by Jayce Rudig-Leathers on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import Gloss



class FroodAPI {
    
    let serverURL:String
    
    init(serverURL:String) {
        self.serverURL = serverURL
    }
    
    func getAllEvents() -> [Event]? {
        var events:[Event]?
        
        let requestURL: NSURL = NSURL(string: serverURL + "/api/events")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
            (data, response, error) -> Void in
            
//            let httpResponse = response as! NSHTTPURLResponse
            guard let responseData = data else {
                return
            }
            guard error == nil else {
                return
            }
            
//            let statusCode = httpResponse.statusCode
            
//            if (statusCode == 200) {
            
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options:.AllowFragments)
                    
                    events = Event.modelsFromJSONArray(json as! [JSON])
                    
                }catch {
                    print("Error with Json: \(error)")
                    
                }
                
//            }
            
        })
        
        task.resume()
        sleep(4)
        return events
    }
    
//    func addEvent(event:Event) {
//        let request = NSMutableURLRequest(URL: NSURL(string: serverURL)!)
//        request.HTTPMethod = "POST"
//        request.addValue("application/json",
//        forHTTPHeaderField: "Content-Type")
////        let jsonString = JSONStringify(jsonObj)
//        let data: NSData = jsonString.dataUsingEncoding(
//            NSUTF8StringEncoding)!
//        request.HTTPBody = data
//        HTTPsendRequest(request,callback: callback)
//    }
}
