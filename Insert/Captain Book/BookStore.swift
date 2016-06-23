//
//  BookStore.swift
//  Captain Book
//
//  Created by Mastere 1 IT on 21/06/2016.
//  Copyright © 2016 Maeva Aoigami. All rights reserved.
//

import Foundation

class BookStore {
    
    var books : [Book] = []
    
    init() {
        let book1 = Book(title: "Toto", author: "Tata", descr: "Titi")
        books.append(book1)
        
        
        let book2 = Book(title: "Roro", author: "Rara", descr: "Riri")
        books.append(book2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myList") as? NSData {
            let _mySavedList = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Book]
            print(_mySavedList)
            books = _mySavedList
        }
        
    }
}