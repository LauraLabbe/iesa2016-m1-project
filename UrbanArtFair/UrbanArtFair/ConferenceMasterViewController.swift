//
//  ConferenceMasterViewController.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import UIKit

class ConferenceMasterViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var detailViewController: ConferenceDetailViewController? = nil
    
    var objects = NSMutableArray()
    var myConfPlanning: Planning = Planning()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Gestion Menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Nouvelle conférence",
            message: "Entrez votre nouvelle conférence",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) {
            (action: UIAlertAction) -> Void in
            let textField = alert.textFields![0]
            
            let confe = Conference(name: textField.text!, time: "12-04-2016", intervenant: "Paul Jacques", desc: "Qu'est-ce que le Street Art ?")
            
            self.myConfPlanning.conf.append(confe)
            let indexPath = NSIndexPath(forRow: 2, inSection: 0)
            self.tableView.reloadData()
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let data = NSKeyedArchiver.archivedDataWithRootObject(self.myConfPlanning.conf)
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "myListPlanning")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
            (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showConference" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedConf:Conference = myConfPlanning.conf[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ConferenceDetailViewController

                controller.detailItemConference = selectedConf
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myConfPlanning.conf.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlanningCell", forIndexPath: indexPath)
        cell.textLabel!.text = myConfPlanning.conf[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    //NSIndexPath a section qui renvoie un Int et row qui renvoie un Int
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    
}
