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
        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
        
//        if let split = self.splitViewController {
//            let controllers = split.viewControllers
//            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? GalerieDetailViewController
//        }
    }
    
//    override func viewWillAppear(animated: Bool) {
//        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
//        super.viewWillAppear(animated)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func insertNewObject(sender: AnyObject) {
//        
//        let alert = UIAlertController(title: "Nouvelle galerie",
//            message: "Entrez votre nom de galerie",
//            preferredStyle: .Alert)
//        
//        let saveAction = UIAlertAction(title: "Save", style: .Default) {
//            (action: UIAlertAction) -> Void in
//            let textField = alert.textFields![0]
//            
//            let galerie = Galerie(name: textField.text!, nameArtist: "Shepard Fairey", place: "122 rue du Commandant Rolland 13008 Marseille", desc: "Livraison de tableaux et autres oeuvres possibles.")
//            
//            self.myGalArtist.gale.append(galerie)
//            let indexPath = NSIndexPath(forRow: 2, inSection: 0)
//            self.tableView.reloadData()
//            
//            let defaults = NSUserDefaults.standardUserDefaults()
//            
//            let data = NSKeyedArchiver.archivedDataWithRootObject(self.myGalArtist.gale)
//            NSUserDefaults.standardUserDefaults().setObject(data, forKey: "myListGalerie")
//            
//        }
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
//            (action: UIAlertAction) -> Void in
//        }
//        
//        alert.addTextFieldWithConfigurationHandler {
//            (textField: UITextField!) -> Void in
//        }
//        
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//        
//        presentViewController(alert, animated: true, completion: nil)
//        
//    }
    
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
//        else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
    }

    
}
