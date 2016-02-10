//
//  SettingsViewController.swift
//  tips
//
//  Created by Hyun Lim on 2/9/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTipControl.selectedSegmentIndex = TipsHelper.getDefaultTip()
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        TipsHelper.setDefaultTip(self.defaultTipControl.selectedSegmentIndex)
    }

}
