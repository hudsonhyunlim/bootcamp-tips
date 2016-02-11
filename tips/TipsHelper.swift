//
//  TipsHelper.swift
//  tips
//
//  Created by Hyun Lim on 2/9/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import Foundation

public final class TipsHelper {
    
    public static let TIP_PERCENTAGES = [0.18, 0.2, 0.22]
    private static let DEFAULT_TIP_INDEX_KEY = "tips.defaultTipPercentage"
    private static let RECENT_TIP_KEY = "tips.recentTip"
    private static let RECENCY_DURATION = 60.0 * 10.0
    
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
    
    public static func getRecentBill() -> Double {
        let now = NSDate().timeIntervalSince1970
        let defaults = NSUserDefaults.standardUserDefaults()
        let timed = defaults.objectForKey(TipsHelper.RECENT_TIP_KEY) as? [String: Double]
        if (timed != nil && (now - timed!["timestamp"]!) < TipsHelper.RECENCY_DURATION) {
            return timed!["bill"]!
        } else {
            return 0.0
        }
    }
    
    public static func setRecentBill(tip: Double) -> Void {
        let timed = [
            "bill": tip,
            "timestamp": NSDate().timeIntervalSince1970
        ]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(timed, forKey: TipsHelper.RECENT_TIP_KEY)
        defaults.synchronize()
    }
    
    public static func formatCurrency(amount: Double) -> String? {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(amount)
    }
    
}