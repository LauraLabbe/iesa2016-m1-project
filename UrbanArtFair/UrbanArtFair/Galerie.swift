//
//  Galerie.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 24/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Galerie: NSObject {
    var name: String = "Name"
    var nameArtist: String = "Name Artist"
    var place: String = "Place"
    var desc: String = "Description"
    
    init(name: String, nameArtist: String, place: String, desc: String) {
        self.name = name
        self.nameArtist = nameArtist
        self.place = place
        self.desc = desc
        
    }
    
    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
        self.nameArtist = decoder.decodeObjectForKey("nameArtist") as! String
        self.place = decoder.decodeObjectForKey("place") as! String
        self.desc = decoder.decodeObjectForKey("desc") as! String
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.nameArtist, forKey: "nameArtist")
        coder.encodeObject(self.place, forKey: "place")
        coder.encodeObject(self.place, forKey: "desc")
    }
    
}