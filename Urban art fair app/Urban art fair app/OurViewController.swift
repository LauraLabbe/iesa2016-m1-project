//
//  OurViewController.swift
//  Urban art fair app
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 Mastere 1 IT. All rights reserved.
//

import UIKit

class OurViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
