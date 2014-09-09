//
//  SettingsUIViewController.swift
//  Tipster
//
//  Created by Aditya Parikh on 9/8/14.
//  Copyright (c) 2014 Aditya Parikh. All rights reserved.
//

import UIKit

class SettingsUIViewController: UIViewController {


    @IBOutlet weak var defaultTipPercentageControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentage = defaults.objectForKey("defaultTipPercentageIndex") as Int?
        if defaultTipPercentage != nil{
            defaultTipPercentageControl.selectedSegmentIndex = defaultTipPercentage!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func defaultTipPercentageChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(defaultTipPercentageControl.selectedSegmentIndex, forKey: "defaultTipPercentageIndex")
        defaults.synchronize()
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
