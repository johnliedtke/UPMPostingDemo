//
//  SellDescriptionViewController.swift
//  UPMPostingDemo
//
//  Created by John Liedtke on 10/18/14.
//  Copyright (c) 2014 John Liedtke. All rights reserved.
//

import UIKit


class SellDescriptionViewController: UIViewController {
    @IBOutlet var textViewHeight: NSLayoutConstraint!
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification center
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardAppeared:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        self.textView.becomeFirstResponder()

        self.view.backgroundColor = UIColor.standardBackgroundColor()
    }

    @IBAction func cancelPushed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    deinit {
        //self.removeObserver(self, forKeyPath: UIKeyboardWillChangeFrameNotification)
        
    }

    
    func keyboardAppeared(notification: NSNotification) -> Void {
        if let userInfo = notification.userInfo as? Dictionary<NSString, NSValue> {
            
            if let keyboardFrameBegin = userInfo[UIKeyboardFrameBeginUserInfoKey] {
                var keyboardFrameBeginRext: CGRect = keyboardFrameBegin.CGRectValue()
                textViewHeight.constant = self.view.frame.height - (self.getNavigationBarHeight() + keyboardFrameBeginRext.height + 50)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
