//
//  Conference.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Conference {
    
    var conf : [Planning] = []
    
    init() {
        let conf1 = Planning(name: "Toto", time: "10-04-2016", intervenant: "Thierry Duval", desc: "Conf of Street Art")
        conf.append(conf1)
        
        let conf2 = Planning(name: "Conference of Art Street", time: "11-04-2016", intervenant: "Jean Dupont" ,desc: "Conf of Art Street")
        conf.append(conf2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myList") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Planning]
            print(_mySavedList)
            conf = _mySavedList
        }
        
    }
}