//
//  ViewController.swift
//  tips
//
//  Created by Hyun Lim on 2/9/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private static let TIP_PERCENTAGES = [0.18, 0.2, 0.22]

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tipLabel.text = "$0.00"
        self.totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tipControl.selectedSegmentIndex = TipsHelper.getDefaultTip()
    }

    @IBAction func onBillEditingChanged(sender: AnyObject) {
        let tipPercentage = ViewController.TIP_PERCENTAGES[self.tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: self.billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        self.tipLabel.text = String(format: "$%.2f", tip)
        self.totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onViewTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
}

