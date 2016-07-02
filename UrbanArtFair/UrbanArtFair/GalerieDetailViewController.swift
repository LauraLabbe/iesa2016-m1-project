//
//  ExposantsDetailViewController.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import UIKit

class GalerieDetailViewController: UIViewController {
    
    @IBOutlet weak var nameGalerieLabel: UILabel!
    @IBOutlet weak var nameArtistLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var detailItemGalerie: AnyObject? {
        didSet {
            
        }
    }
    
    func configureView() {
        if let detail: AnyObject = self.detailItemGalerie {
            let art = detail as! Galerie
            nameGalerieLabel.text = art.name
            nameArtistLabel.text = art.nameArtist
            placeLabel.text = art.place
            descriptionLabel.text = art.desc
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        //Gestion Menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
