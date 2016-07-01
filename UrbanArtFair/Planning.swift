//
//  Conference.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Planning {
    
    var conf : [Conference] = []
    
    init() {
        let conf1 = Conference(name: "Conference du nouveau Street Art", time: "10-04-2016", intervenant: "Thierry Duval", desc: "Venez apprendre les méthodes de création du nouveau Street Art.")
        conf.append(conf1)
        
        let conf2 = Conference(name: "Comment faire du Street Art ?", time: "11-04-2016", intervenant: "Jean Dupont" ,desc: "Venez apprendre à faire du street art. Du débutant à l'amateur, venez vous améliorer de manière ludique.")
        conf.append(conf2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myListPlanning") as? NSData {
            let _mySavedListPlanning = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Conference]
            conf = _mySavedListPlanning
        }
        
    }
}