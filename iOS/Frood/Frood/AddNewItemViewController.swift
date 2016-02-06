//
//  AddNewItemViewController.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/6/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import Foundation
import UIKit

class AddNewItemViewController : UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameOfEventTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var submitEventButton: UIButton!
    
    var event:Event!
    var foodImage:UIImage!
    
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
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.foodImage = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    @IBAction func submitEventButtonPressed(sender: AnyObject) {
        
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
            
            // Set up image
            if let food = foodImage {
                self.event.foodImage = food
            }
            
            
            HackySplitViewController.passedDetailItem = event
            HackySplitViewController.justAdded = true
            
            // Save event
       }
    }
}