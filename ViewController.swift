//
//  ViewController.swift
//  Tipster
//
//  Created by Aditya Parikh on 9/8/14.
//  Copyright (c) 2014 Aditya Parikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentagesSegmentedControl: UISegmentedControl!
    var defaultTipPercentage :Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults = NSUserDefaults.standardUserDefaults()
        defaultTipPercentage = defaults.objectForKey("defaultTipPercentageIndex") as Int?
        if defaultTipPercentage != nil{
            tipPercentagesSegmentedControl.selectedSegmentIndex = defaultTipPercentage!
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaultTipPercentage = defaults.objectForKey("defaultTipPercentageIndex") as Int?
        if defaultTipPercentage != nil{
            tipPercentagesSegmentedControl.selectedSegmentIndex = defaultTipPercentage!
        }
        
        onBillAmountChanged(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        billAmountTextField.endEditing(true);
    }

    @IBAction func onBillAmountChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.20, 0.25]
        var billAmount = Double((billAmountTextField.text as NSString).doubleValue);
        var tipAmount = billAmount * tipPercentages[tipPercentagesSegmentedControl.selectedSegmentIndex];
        var totalAmount = tipAmount + billAmount;
        
        tipAmountLabel.text = String(format: "$%0.2f", tipAmount)
        totalAmountLabel.text = String(format: "$%0.2f", totalAmount)
    }
}

