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
    
    let itemArchiveURL:NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")}()

    init()  {
        if  let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item] {
            allItems += archivedItems
        }
    }
    
    
    func saveChanges() -> Bool  {
        print("Saving items to :\(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
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
    
    func removeItem(item:Item)  {
      if  let index = allItems.indexOf(item)  {
        allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex:Int)   {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.removeAtIndex(fromIndex)
        allItems.insert(movedItem, atIndex: toIndex)
    }
}
