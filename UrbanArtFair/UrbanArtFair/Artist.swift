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
        let gale1 = Galerie(name: "Artistik Rezo", nameArtist: "Bansky", place: "14 Rue Alexandre Dumas, 75011 Paris", desc: "Martha Cooper est née en 1942 à Baltimore (US). En 1980, elle quitte son poste de photographe au New York Post pour se consacrer entièrement à photographier le milieu émergeant du Hip Hop et du graffiti à New-York et plus particulièrement dans le Bronx. Elle arrive à se faire accepter dans le milieu et rencontre les plus grands artistes : Run Dmc, Seen, Futura 2000… ")
        gale.append(gale1)
        
        let gale2 = Galerie(name: "Galerie Itinerrance", nameArtist: "Vhils", place: "7bis Rue René Goscinny, 75013 Paris", desc: "Né en 1940 en Pennsylvanie. Il a étudié à l’université de Stanford University, où il s’est spécialisé en Grec classique. Plus tard, Henry Chalfant poursuit une carrière de sculpteur, expose son travail à New York et en Europe. Il s’est tourné vers la photo et le film documentaire afin de faire une étude approfondie de la culture Hip-hop et de l’art Graffiti. Henry Chalfant, co-producteur du film documentaire « Style Wars », sculpteur et photographe, explique comment il est devenu au début des années 80 l’archiviste officieux de l’art Graffiti a New York City.")
        gale.append(gale2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myListGalerie") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Galerie]
            gale = _mySavedList
        }
        
    }
}	