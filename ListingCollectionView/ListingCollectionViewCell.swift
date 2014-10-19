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
    
    public var title: String? {
        didSet {
            titleTextView.text = title
        }
    }
    
    public func startLoading () {
        self.activityIndicator.startAnimating()
    }
    
    public func stopLoading() {
        self.activityIndicator.stopAnimating()
    }
    
    override public var  highlighted: Bool {
        didSet {
            if highlighted {
                self.backgroundColor = highlighedBackgroundColor
            } else {
                self.backgroundColor = defaultBackgroundColor
            }
        }
    }
    var defaultBackgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    var highlighedBackgroundColor = UIColor(red: 245.0/255, green: 245.0/255, blue: 245.0/255, alpha: 1.0)

    @IBOutlet public weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var titleTextView: UITextView!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.backgroundColor = self.defaultBackgroundColor.CGColor
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1.0).CGColor

       // self.titleTextView.backgroundColor = UIColor.clearColor()
        
    }
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.titleTextView.removeInsets()


    }
    
    
    
}
