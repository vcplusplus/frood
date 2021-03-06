//
//  DetailViewController.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/5/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var eventNameLabel: UINavigationItem!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var locationTextView: UITextView!
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    
    var happyHeart:Bool!
    var negativeReport:Bool!
    
    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        if (HackySplitViewController.justAdded != nil) {
            configureEvent(HackySplitViewController.passedDetailItem)
            HackySplitViewController.justAdded = false
            MasterViewController.passedEvent = HackySplitViewController.passedDetailItem
            MasterViewController.isThereAPassedEvent = true
            
        } else {
            // Update the user interface for the detail item.
            if let event = self.detailItem {
                // Setting stuff up based on the detailItem (the Event!)
                configureEvent(event)
            }
        }
    }
    
    func configureEvent(event:Event) {
        self.eventNameLabel.title = event.name
        if let startTime = self.startTime {
            startTime.text = event.start
        }
        if let endTime = self.endTime {
            endTime.text = event.end
        }
        if let foodImage = imageView {
            foodImage.image = UIImage(named: "foodImagePlaceholder")
        }
        if let description = descriptionTextView {
            description.text = event.description
        }
        if let location = locationTextView {
            location.text = "Location: \(event.location!)"
        }
        if let heart = heartButton {
            happyHeart = false;
            heart.setImage(UIImage(named:"unfilledHeart"), forState: UIControlState.Normal)
            
        }
        if let report = reportButton {
            negativeReport = false;
            report.setImage(UIImage(named:"unfilledExclamationPoint"), forState: UIControlState.Normal)
        }
    }
    
    @IBAction func heartButtonPressed(sender: AnyObject) {
        if (happyHeart!) {
            heartButton.setImage(UIImage(named:"unfilledHeart"), forState: UIControlState.Normal)
            happyHeart = false
        } else {
            heartButton.setImage(UIImage(named:"filledHeart"), forState: UIControlState.Normal)
            happyHeart = true
        }
    }
    
    @IBAction func reportButtonPressed(sender: AnyObject) {
        if (negativeReport!) {
            reportButton.setImage(UIImage(named:"unfilledExclamationPoint"), forState: UIControlState.Normal)
            negativeReport = false
        } else {
            reportButton.setImage(UIImage(named: "filledExclamationPoint"),
                forState:UIControlState.Normal)
            negativeReport = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

