//
//  ItemStore.swift
//  HomePwner
//
//  Created by BUKOLA OMOTOSO on 21/07/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit
class ItemStore {
    var allItems = [Item]()
    init()  {
        for _ in 0..<5{
            createItem()
        }
        appendTrailer()
    }
    
    func appendTrailer()    {
        let newItem = Item()
        newItem.name = "No more Items!"
        allItems.append(newItem)
    }
    
    func createItem() ->Item    {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
}
