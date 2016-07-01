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
        let gale1 = Galerie(name: "Artistik Rezo", nameArtist: "Bansky", place: "14 Rue Alexandre Dumas, 75011 Paris", desc: "Découvrez l'art revisitez par un des plus grands artistes de Street Art.")
        gale.append(gale1)
        
        let gale2 = Galerie(name: "Galerie Itinerrance", nameArtist: "Vhils", place: "7bis Rue René Goscinny, 75013 Paris", desc: "Nouvelle galerie de Street Art pour découvrir les subtilités de cet art.")
        gale.append(gale2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myListGalerie") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Galerie]
            gale = _mySavedList
        }
        
    }
}	