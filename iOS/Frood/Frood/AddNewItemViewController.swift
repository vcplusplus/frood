//
//  AddNewItemViewController.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import UIKit

class AddNewItemViewController : UIViewController {
    
    @IBOutlet weak var nameOfEventTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var event:Event
    
    @IBAction func uploadImageButtonPressed(sender: AnyObject) {
        
    }
    
    
    @IBAction func submitEventButtonPressed(sender: AnyObject) {
        
        
    }
    
}