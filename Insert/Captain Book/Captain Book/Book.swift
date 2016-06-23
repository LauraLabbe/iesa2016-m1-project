//
//  Book.swift
//  Captain Book
//
//  Created by Mastere 1 IT on 21/06/2016.
//  Copyright © 2016 Maeva Aoigami. All rights reserved.
//

import Foundation

class Book: NSObject {
    
    var title: String = "Title"
    var author: String = "Author"
    var descr: String = "Description"
    
    init(title: String, author: String, descr: String) {
        self.title = title
        self.author = author
        self.descr = descr
    }
    
    init(coder decoder: NSCoder) {
        self.title = decoder.decodeObjectForKey("title") as! String
        self.author = decoder.decodeObjectForKey("author") as! String
        self.descr = decoder.decodeObjectForKey("descr") as! String
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.author, forKey: "author")
        coder.encodeObject(self.descr, forKey: "descr")
    }
    
}