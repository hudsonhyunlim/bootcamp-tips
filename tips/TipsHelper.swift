//
//  TipsHelper.swift
//  tips
//
//  Created by Hyun Lim on 2/9/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import Foundation

public final class TipsHelper {
    static let DEFAULT_TIP_INDEX_KEY = "tips.defaultTipPercentage"
    
    public static func getDefaultTip() -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey(TipsHelper.DEFAULT_TIP_INDEX_KEY)
        return defaultTip
    }
    
    public static func setDefaultTip(defaultTip: Int) -> Void {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(
            defaultTip,
            forKey: TipsHelper.DEFAULT_TIP_INDEX_KEY
        )
        defaults.synchronize()
    }
    
}