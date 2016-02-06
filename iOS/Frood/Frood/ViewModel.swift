//
//  ViewModel.swift
//  Frood
//
//  Created by Jayce Rudig-Leathers on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation

protocol EventReceiver {
    func OnEventsReceived(events:[Event])
}

class ViewModel {
    
    let API:FroodAPI
    var receiver:EventReceiver?
    
    init() {
        API = FroodAPI(serverURL: "http://frood.georgewitteman.com")
    }
    
    func setEventReceiver(receiver:EventReceiver) {
        self.receiver = receiver
    }
    
    
    func requestCurrentEvents() {
        
        API.getAllEvents({(events:[Event]?, error:String?) -> Void in
            guard error == nil else {
                print(error)
                return
            }
            self.receiver?.OnEventsReceived(events!)
        })
    }
    
    func addEvent(newEvent:Event) {
        API.addEvent(newEvent)
    }
}