//
//  DescriptionTextView.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/19/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit

@IBDesignable
class DescriptionTextView: UITextView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0).CGColor
        self.layer.cornerRadius = 10
        
        let inset: CGFloat = 10.0
        
        self.textContainerInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset - 5)
        

    }

}
