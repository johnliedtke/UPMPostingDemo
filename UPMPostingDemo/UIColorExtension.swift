//
//  UIColorExtension.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/18/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import Foundation

extension UIColor {
    
    class func lightPurpleColor() -> UIColor {
        var lightPurpleColor = UIColor(red: 134.0/255.0, green: 92.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        return lightPurpleColor
    }
    
    class func darkPurpleColor() -> UIColor {
        var lightPurpleColor = UIColor(red: 142.0/255.0, green: 26.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        return lightPurpleColor
    }
    
    class func standardBackgroundColor() -> UIColor {
        var standardBackgroundColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        return standardBackgroundColor
    }
    
    class func flatGreenColor() -> UIColor {
        return UIColor(red: 46.0/255.0, green: 204.0/255.0, blue: 113.0/255.0, alpha: 1.0)
    }
    
    class func tabBarUnselectedColor() -> UIColor {
        return UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
    }

    
}