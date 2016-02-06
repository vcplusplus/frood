//
//  MasterViewController.swift
//  Frood
//
//  Created by Kathryn Hodge on 2/5/16.
//  Copyright © 2016 blondiebytes. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    // also very bad and hacky
    static var passedEvent:Event!
    static var isThereAPassedEvent:Bool!

    var events = [Event]()
    var model:ViewModel?
    var api:FroodAPI?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = ViewModel()
        api = FroodAPI(serverURL: "http://frood.georgewitteman.com")
        api!.getAllEvents({(events:[Event]?, error:String?) -> Void in
            guard error == nil else {
                print(error)
                return
            }
            
            
            self.events = events!
            print(events)
        })
//        usleep(50000)
        api!.addEvent(Event(json: testJSON)!)
        // Do any additional setup after loading the view, typically from a nib.
       let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }


    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
        if (MasterViewController.isThereAPassedEvent != nil) {
            events.append(MasterViewController.passedEvent)
        }
        // load up everything we have so far
        // requires API call !!!!
        //if (MasterViewController.isThereAPassedEvent != nil) {
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

    func insertNewObject(sender: AnyObject) {
        // eventually pull up a view that's like hey set up this event !!
          performSegueWithIdentifier("addNewItem", sender:self)
        //events.insert(e, atIndex: 0)
        //let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        //self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let event = events[indexPath.row] as! Event
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
        let object = events[indexPath.row] as! Event
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

