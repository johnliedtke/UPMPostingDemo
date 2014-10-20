//
//  UIViewControllerExtension.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/19/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func getNavigationBarHeight() -> CGFloat {
        return (self.navigationController?.navigationBar.frame.height)!
    }
    
}
