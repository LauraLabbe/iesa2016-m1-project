//
//  OurViewController.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import UIKit

class AccueilSidebar: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1200
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
