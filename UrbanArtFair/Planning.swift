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
        let conf1 = Conference(name: "Toto", time: "10-04-2016", intervenant: "Thierry Duval", desc: "Conf of Street Art")
        conf.append(conf1)
        
        let conf2 = Conference(name: "Conference of Art Street", time: "11-04-2016", intervenant: "Jean Dupont" ,desc: "Conf of Art Street")
        conf.append(conf2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myList") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Conference]
            print(_mySavedList)
            conf = _mySavedList
        }
        
    }
}