//
//  ViewController.swift
//  tips
//
//  Created by Hyun Lim on 2/9/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let recentTip = TipsHelper.getRecentBill()
        self.tipLabel.text = "$0.00"
        self.totalLabel.text = "$0.00"
        self.billField.text = recentTip != 0.0 ? String(format:"%.0f", recentTip) : ""
        self.billField.becomeFirstResponder()
        self.updateTotals()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tipControl.selectedSegmentIndex = TipsHelper.getDefaultTip()
        self.updateTotals()
    }

    @IBAction func onBillEditingChanged(sender: AnyObject) {
        self.updateTotals()
    }

    @IBAction func onViewTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    private func updateTotals() {
        let tipPercentage = TipsHelper.TIP_PERCENTAGES[self.tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: self.billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        self.tipLabel.text = TipsHelper.formatCurrency(tip)
        self.totalLabel.text = TipsHelper.formatCurrency(total)
        
        TipsHelper.setRecentBill(billAmount)
    }
}

