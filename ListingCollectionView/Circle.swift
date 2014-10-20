//
//  Circle.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/18/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class Circle: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    
    @IBInspectable var circleColor: UIColor = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buffer: CGFloat = 5.0
        
        let width = self.frame.width - buffer
        let height = self.frame.height - buffer
        
        var circleView = UIView(frame: CGRectMake(buffer / 2, buffer / 2, width, height))
        circleView.layer.cornerRadius = width / 2.0
        circleView.backgroundColor = circleColor
       // circleView.layer.borderWidth = 1.0
//        circleView.layer.borderColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0).CGColor
        
        self.addSubview(circleView)
        self.backgroundColor = UIColor.clearColor()

    }

}
