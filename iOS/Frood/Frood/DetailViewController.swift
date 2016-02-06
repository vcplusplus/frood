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
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var reportImageView: UIImageView!
    
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
        self.eventNameLabel.title = event.title
        if let startTime = self.startTime {
            startTime.text = event.start
        }
        if let endTime = self.endTime {
            endTime.text = event.end
        }
        if let foodImage = imageView {
            foodImage.image = event.foodImage
        }
        if let description = descriptionTextView {
            description.text = event.description
        }
        if let location = locationTextView {
            location.text = "Location: \(event.location)"
        }
        if let heart = heartImageView {
            heart.image = UIImage(named: "filledHeart")
        }
        if let report = reportImageView {
            report.image = UIImage(named: "filledExclamationPoint")
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

