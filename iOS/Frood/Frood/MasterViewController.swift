//
//  MasterViewController.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/5/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController{
    @IBOutlet var table: UITableView!

    var detailViewController: DetailViewController? = nil
    var events = [Event]()
    // also very bad and hacky
    static var passedEvent:Event!
    static var isThereAPassedEvent:Bool!

    var model:ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = ViewModel()
        model?.setEventReceiver(self)
        model?.requestCurrentEvents()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        // load up everything we have so far
        // requires API call !!!!
        reloadInputViews()
    }


    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
        if let bo = MasterViewController.isThereAPassedEvent {
            if (bo) {
                events.append(MasterViewController.passedEvent)
                //events.insert(MasterViewController.passedEvent, atIndex: 0)
               // let indexPath = NSIndexPath(forRow: 0, inSection: 0)
               // self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                 MasterViewController.isThereAPassedEvent = false
            }
            
        }
        
        //if (MasterViewController.isThereAPassedEvent) {
        //    events.insert(MasterViewController.passedEvent, atIndex: 0)
        //    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        //    self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
         //   MasterViewController.isThereAPassedEvent = false
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let event = events[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = event // passing our event
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        } else if segue.identifier == "addNewItem" {
            
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Set up cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let object = events[indexPath.row]
        cell.textLabel!.text = object.name!
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            events.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

extension MasterViewController: EventReceiver {
    func OnEventsReceived(events: [Event]) {
        self.events = events
        table.reloadData()
    }
}

