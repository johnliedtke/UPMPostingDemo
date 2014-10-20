//
//  SellTitlePhotoTableViewCell.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/18/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit

@IBDesignable
class SellTitlePhotoTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.clearColor()
        self.contentView.backgroundColor = UIColor.clearColor()
        
        // Remove borderes
        var topBorder = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 1.0))
        topBorder.backgroundColor = UIColor.standardBackgroundColor()
        self.addSubview(topBorder)
    
        var bottomBorder = UIView(frame: CGRectMake(0, self.frame.height-1, UIScreen.mainScreen().bounds.width, 1.0))
        bottomBorder.backgroundColor = UIColor.standardBackgroundColor()
        self.addSubview(bottomBorder)
    }

}
