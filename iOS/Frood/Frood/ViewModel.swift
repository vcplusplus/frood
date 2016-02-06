//
//  ViewModel.swift
//  Frood
//
//  Created by Jayce Rudig-Leathers on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation

class ViewModel {
    
    func getCurrentEvents() -> [Event] {
        return [Event(json: testJSON)!,Event(json: testJSON)!]
    }
    
    func addEvent(newEvent:Event) {
        
    }
}