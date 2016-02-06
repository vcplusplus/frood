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
    @IBOutlet weak var tagsTextView: UITextView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var reportImageView: UIImageView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let _ = self.detailItem {
            if let eventTitle = self.eventNameLabel {
                eventTitle.title = "CommunityHack"
            }
            if let start = self.startTime {
                start.text = "7:00pm Feb. 5th"
            }
            if let end = self.endTime {
                end.text = "7:00pm Feb. 6th"
            }
            if let image = self.imageView {
                
            }

            if let description = self.descriptionTextView {
                description.text = "A hackathon for all of your friends! No coding experience needed!!!! Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
            }
            
            if let tags = self.tagsTextView {
                tags.text = "Tags: Pizza"
            }
            if let heart = self.heartImageView {
                
            }
            if let report = self.reportImageView {
                
            }
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

