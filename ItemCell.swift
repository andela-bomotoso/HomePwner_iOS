//
//  ItemCell.swift
//  HomePwner
//
//  Created by BUKOLA OMOTOSO on 25/07/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit
    class ItemCell : UITableViewCell    {
        @IBOutlet var nameLabel: UILabel!
        @IBOutlet var serialNumberLabel: UILabel!
        @IBOutlet var valueLabel: UILabel!
        
        func updateLabel()  {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
            
        let captionFont = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
            serialNumberLabel.font = captionFont
        }
        
    }

