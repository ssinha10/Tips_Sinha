//
//  ViewController.swift
//  Tips_Sinha
//
//  Created by Suraj Sinha on 12/4/15.
//  Copyright © 2015 KingSoy. All rights reserved.
//

import UIKit
import MessageUI
import Social //needed for facebook integration



class ViewController: UIViewController {


    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitFour: UILabel!
    @IBOutlet weak var splitThree: UILabel!
    @IBOutlet weak var splitTwo: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var splitMore: UILabel!
   
    
    var totalTip = 0.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.0, 0.0, 0.0]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * totalTip
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let splitFourways = total / 4
        let splitThreeways = total / 3
        let splitTwoways = total / 2
        
        splitFour.text = String(format: "$%.2f", splitFourways)
        splitThree.text = String(format: "$%.2f", splitThreeways)
        splitTwo.text = String(format: "$%.2f", splitTwoways)
        
        let numberEntered = NSString(string: splitField.text!).doubleValue
        if (numberEntered <= 0){
            splitMore.text = "N/A"
        }
        else {
            var split = total / numberEntered
            splitMore.text = String(format: "$%.2f", split)
        }
    }
    
    
    
    @IBAction func onNumberChange(sender: AnyObject) {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * totalTip
        let total = billAmount + tip
        
        //let total = NSString(string: totalLabel.text!).doubleValue
        let numberEntered = NSString(string: splitField.text!).doubleValue
        var split = total / numberEntered
        
        if (numberEntered <= 0){
            splitMore.text = "N/A"
        }
        else {
            splitMore.text = String(format: "$%.2f", split)
        }
    }
    
    
    
    @IBAction func numberChanged(sender: AnyObject) {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * totalTip
        let total = billAmount + tip
        
        //let total = NSString(string: totalLabel.text!).doubleValue
        let numberEntered = NSString(string: splitField.text!).doubleValue
        var split = total / numberEntered
        if (numberEntered <= 0){
            splitMore.text = "N/A"
        }
        else {
            var split = total / numberEntered
            splitMore.text = String(format: "$%.2f", split)
        }
    }
    

    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        label.text = "\(currentValue)"
        var currentValueDouble = Double(currentValue)
        totalTip = currentValueDouble / 100
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * totalTip
        let total = billAmount + tip
        
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let splitFourways = total / 4
        let splitThreeways = total / 3
        let splitTwoways = total / 2
        
        splitFour.text = String(format: "$%.2f", splitFourways)
        splitThree.text = String(format: "$%.2f", splitThreeways)
        splitTwo.text = String(format: "$%.2f", splitTwoways)
        
        let numberEntered = NSString(string: splitField.text!).doubleValue
        if (numberEntered <= 0){
            splitMore.text = "N/A"
        }
        else {
            var split = total / numberEntered
            splitMore.text = String(format: "$%.2f", split)
        }
    }
    
    
    
    @IBAction func screenshotButton(sender: AnyObject) {
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    
    
    
    @IBAction func shareButton(sender: AnyObject) {
        
        

        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            facebookSheet.setInitialText("I just ate at <Restaurant Name> and I <feeling> it!")
            self.presentViewController(facebookSheet, animated: true, completion: nil)
            
        }
        else {
            
            var alert = UIAlertController(title: "Accounts", message: "Please login to Facebook to share", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    


    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

