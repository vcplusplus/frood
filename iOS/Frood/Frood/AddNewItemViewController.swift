//
//  AddNewItemViewController.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import UIKit

class AddNewItemViewController : UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
    @IBOutlet weak var nameOfEventTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var submitEventButton: UIButton!
    var event:Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameOfEventTextField.delegate = self;
        self.locationTextField.delegate = self;
        self.descriptionTextView.delegate = self;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func uploadImageButtonPressed(sender: AnyObject) {
        // Go to where we can upload images
    }

    
    
    @IBAction func submitEventButtonPressed(sender: AnyObject) {
        self.event = Event()
        // set stuff up about the event
        self.event.title = nameOfEventTextField.text!
        self.event.location = locationTextField.text!
        self.event.start = startTimeDatePicker.description
        self.event.end = endTimeDatePicker.description
        self.event.description = descriptionTextView.text
        print(descriptionTextView.text)
        // image stuff later
        // self.event.image = imageView.image
        
        // save the event to the database
        
        // go back to other view
        performSegueWithIdentifier("backToMaster", sender: self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "backToMaster") {
            self.event = Event()
            // set stuff up about the event
            self.event.title = nameOfEventTextField.text!
            self.event.location = locationTextField.text!
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            self.event.start = dateFormatter.stringFromDate(startTimeDatePicker.date)
            self.event.end = dateFormatter.stringFromDate(endTimeDatePicker.date)
            
            self.event.description = descriptionTextView.text
            HackySplitViewController.passedDetailItem = event
            HackySplitViewController.justAdded = true

            //MasterViewController.unwindForSegue(segue, towardsViewController: MasterViewController())
           // var svc = segue.destinationViewController as! MasterViewController;
       }
    }
}