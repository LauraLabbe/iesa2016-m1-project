//
//  PlanningDetailViewController.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import UIKit

class ConferenceDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var intervenantLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var detailItemConference: AnyObject? {
        didSet {
            
        }
    }
    
    func configureView() {
        if let detail: AnyObject = self.detailItemConference {
            let plan = detail as! Conference
            nameLabel.text = plan.name
            timeLabel.text = plan.time
            intervenantLabel.text = plan.intervenant
            descriptionLabel.text = plan.desc
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
