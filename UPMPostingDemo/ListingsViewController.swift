//
//  ListingsViewController.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/5/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit
import ListingCollectionView




let reuseIdentifier = "listingCollectionViewCell"


class ListingsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var listings: [PFObject] = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnSwipe = true
        
        self.fetchListings()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchListings() {
        var query = PFQuery(className: "Listing")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            if let downcastedObjects = objects as? [PFObject] {
                // Add listings to array
                self.listings.removeAll(keepCapacity: false)
                self.listings += downcastedObjects
                self.collectionView?.reloadData()
            }
        }
    }
    
    @IBAction func refreshListings(sender: AnyObject) {
        self.fetchListings()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
       
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.listings.count //self.listings.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ListingCollectionViewCell

        var listing = listings[indexPath.row] as PFObject
        cell.title = listing["title"] as? String
        cell.price = listing["price"] as? String
        
        cell.startLoading()
        var imageFile = listing["photo"] as PFFile
        imageFile.getDataInBackgroundWithBlock { (data: NSData!, error: NSError!) -> Void in
            var image = UIImage(data: data)
            cell.image = nil
            cell.image = image
            cell.stopLoading()
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var spacing:CGFloat = 30.0
        
        // Calculate Height
        var screenWidth = UIScreen.mainScreen().bounds.size.width
        var width:CGFloat = (screenWidth - spacing) / 2.0
        
        // Calculate Width
        var tabBar:CGFloat = (self.tabBarController?.tabBar.frame.height)!
        var navBar:CGFloat = (self.navigationController?.navigationBar.frame.height)!
        var height:CGFloat = (self.view.bounds.size.height - (spacing + tabBar + navBar)) / 2.1
        
        return CGSizeMake(width, height)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView!, shouldHighlightItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView!, shouldSelectItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView!, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, canPerformAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, performAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) {
    
    }
    */

}
