//
//  ItemsViewController.swift
//  HomePwner
//
//  Created by BUKOLA OMOTOSO on 21/07/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit
class ItemsViewController : UITableViewController   {
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top:statusBarHeight, left:0, bottom:0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets  = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        
        UITableViewCell {
       // let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell",forIndexPath: indexPath)

        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
            if item.valueInDollars != 0 {
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            }   else    {
                cell.detailTextLabel?.text = " "
            }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == itemStore.allItems.count - 1)   {
            return 44
        }   else    {
            return 60
        }
    }
}
