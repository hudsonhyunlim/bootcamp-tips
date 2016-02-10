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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tipLabel.text = "$0.00"
        self.totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEditingChanged(sender: AnyObject) {
        let billAmount = NSString(string: self.billField.text!).doubleValue
        let tip = billAmount * 0.2
        let total = billAmount + tip
        
        self.tipLabel.text = String(format: "$%.2f", tip)
        self.totalLabel.text = String(format: "$%.2f", total)
    }

}

