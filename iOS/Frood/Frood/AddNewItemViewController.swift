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
    
    var event:Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func uploadImageButtonPressed(sender: AnyObject) {
        // Go to where we can upload images
    }
    
    
    @IBAction func submitEventButtonPressed(sender: AnyObject) {
        self.event = Event()
        // set stuff up about the event
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      //  if (sender != self.doneButton) {
      //      return
      //  }
    }
}