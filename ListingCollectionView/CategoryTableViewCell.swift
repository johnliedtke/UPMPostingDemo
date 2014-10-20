//
//  CategoryTableViewCell.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/19/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit

public class CategoryTableViewCell: UITableViewCell {
    @IBOutlet var categoryLabel: UILabel!
    
    public var category: String? {
        didSet {
            categoryLabel.text = category
        }
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
