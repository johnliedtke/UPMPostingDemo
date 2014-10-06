//
//  ListingCollectionViewCell.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/5/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit

@IBDesignable
public class ListingCollectionViewCell: UICollectionViewCell {
    
    public var title:String = "meow" {
        didSet {
            titleLabel.text = title
            titleLabel.sizeToFit()
        }
    }
    
    public var image:UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    public var price:String? {
        didSet {
            priceLabel.text = "$" + price!
        }

    }
    
    public func startLoading () {
        self.activityIndicator.startAnimating()
    }
    
    public func stopLoading() {
        self.activityIndicator.stopAnimating()
    }
    

    @IBOutlet public weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
  
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0).CGColor
        // Set height...
        var screenRect:CGRect = UIScreen.mainScreen().bounds
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1.0).CGColor

        if screenRect.width <= 320 {
            
        }

        

        
    }
    
}
