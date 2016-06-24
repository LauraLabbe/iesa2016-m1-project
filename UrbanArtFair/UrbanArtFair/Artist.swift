//
//  Artist.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 24/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Artist {
    
    var gale : [Galerie] = []
    
    init() {
        let gale1 = Galerie(name: "Toto", nameArtist: "Totototoo", place: "Ma rue", desc: "Ma description")
        gale.append(gale1)
        
        let gale2 = Galerie(name: "Totoedrzer", nameArtist: "Totototoosqds", place: "Ma rue efsdfs", desc: "Ma description uhsuygea")
        gale.append(gale2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myListGalerie") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Galerie]
            print(_mySavedList)
            gale = _mySavedList
        }
        
    }
}	