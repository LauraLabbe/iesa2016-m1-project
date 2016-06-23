//
//  Planning.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Planning: NSObject {
    
    var name: String = "Name"
    var time: String = "Time"
    var intervenant: String = "Intervenant"
    var desc: String = "Description"
    
    init(name: String, time: String, intervenant: String, desc: String) {
        self.name = name
        self.time = time
        self.intervenant = intervenant
        self.desc = desc
    }
    
    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
        self.time = decoder.decodeObjectForKey("time") as! String
        self.intervenant = decoder.decodeObjectForKey("intervenant") as! String
        self.desc = decoder.decodeObjectForKey("desc") as! String
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.time, forKey: "time")
        coder.encodeObject(self.intervenant, forKey: "intervenant")
        coder.encodeObject(self.desc, forKey: "desc")
    }
    
}