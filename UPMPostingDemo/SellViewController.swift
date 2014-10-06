//
//  SellViewController.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/5/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit

class SellViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    var imageData: NSData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func post(sender: AnyObject) {
        

        if self.imageData == nil {
            return;
        }
        
        var imageFile = PFFile(name: "meow.png", data: self.imageData)
        imageFile.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            if error == nil {
                var newListing: PFObject = PFObject(className: "Listing")
                newListing.setObject(self.titleField.text, forKey: "title")
                newListing.setObject(self.priceField.text, forKey: "price")
                newListing.setObject(imageFile, forKey: "photo")
                
                newListing.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
                    NSLog("Succesfully saved listing")
                    
                } // end save listing
            } // end no eroor
        }

    }
    
    func cameraButtonTapped() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            // Create image picker controller
            var imagePicker = UIImagePickerController()
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            imagePicker.delegate = self
            
            // Show
            self.presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            var image = UIImage(named: "meow.jpg")
            
            
            var number = arc4random() % 4
            
            switch (number) {
            case 0:
                image = UIImage(named: "meow.jpg")
            case 1:
                image = UIImage(named: "microwave.jpg")
            case 2:
                image = UIImage(named: "fridge.jpg")
            case 3:
                image = UIImage(named: "chair.jpg")
            default:
                image = UIImage(named: "meow.jpg")
                
            }
            
            self.imageData = UIImagePNGRepresentation(image)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // Get the image
        var image = info["UIImagePickerControllerOriginalImage"] as UIImage
        
        // Dismiss controller
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        // Upload
        var imageData = UIImagePNGRepresentation(image)
        self.imageData = imageData
    }
    
    func uploadImage(imageData: NSData) {
        let imageFile = PFFile(name: "meow.png", data: imageData)
       
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2 {
            self.cameraButtonTapped()
        }
    }


    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
