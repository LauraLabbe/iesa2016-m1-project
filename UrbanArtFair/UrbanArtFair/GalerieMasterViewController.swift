//
//  ExposantsMasterViewController.switch.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import UIKit

class GalerieMasterViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var detailViewController: GalerieDetailViewController? = nil
    
    var objects = NSMutableArray()
    var myGalArtist: Artist = Artist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gestion Menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showGalerie" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedGale:Galerie = myGalArtist.gale[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! GalerieDetailViewController
                
                controller.detailItemGalerie = selectedGale
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGalArtist.gale.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GalerieCell", forIndexPath: indexPath)
        cell.textLabel!.text = myGalArtist.gale[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    //NSIndexPath a section qui renvoie un Int et row qui renvoie un Int
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            myGalArtist.gale.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let data = NSKeyedArchiver.archivedDataWithRootObject(self.myGalArtist.gale)
            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "myListGalerie")
            
        }
    }

    
}
