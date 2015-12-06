//
//  ViewController.swift
//  Tips_Sinha
//
//  Created by Suraj Sinha on 12/4/15.
//  Copyright © 2015 KingSoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitFour: UILabel!
    @IBOutlet weak var splitThree: UILabel!
    @IBOutlet weak var splitTwo: UILabel!
    
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
        var tempstr = ""
        
        
        
        var tipPercentages = [0.0, 0.0, 0.0]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * totalTip
        let total = billAmount + tip
        
        //tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let splitFourways = total / 4
        let splitThreeways = total / 3
        let splitTwoways = total / 2
        
        splitFour.text = String(format: "$%.2f", splitFourways)
        splitThree.text = String(format: "$%.2f", splitThreeways)
        splitTwo.text = String(format: "$%.2f", splitTwoways)
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
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
        
        //var tipPercentage = Double(currentValue / 100)
        
        //let billAmount = NSString(string: billField.text!).doubleValue
        //let tip = billAmount * tipPercentage
        //let total = billAmount + tip
        
        //tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
    
        
    }
    
    
    
//slider stuff
    
//    @IBAction func onEditingSlider(sender: AnyObject) {
//        var tipPercentage = Int(sender.value)
//
//        let billAmount = NSString(string: billField.text!).doubleValue
//        let tip = billAmount * tipPercentage
//        let total = billAmount + tip
//        tipLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
//
//    }
    

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

