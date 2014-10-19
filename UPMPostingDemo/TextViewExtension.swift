//
//  TextViewExtension.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/18/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import Foundation


extension UITextView {
    
    func removeInsets() {
        self.textContainerInset = UIEdgeInsetsZero
        self.textContainer.lineFragmentPadding = 0
    
    }
    
}
