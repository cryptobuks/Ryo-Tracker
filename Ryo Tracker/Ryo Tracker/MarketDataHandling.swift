//
//  MarketDataHandling.swift
//  Ryo Tracker
//
//  Created by Will Ravenscroft on 26/06/2018.
//  Copyright © 2018 Zypher DX. All rights reserved.
//

import Foundation

struct OHLCForm {
    public var date: Date
    public var open: Double
    public var high: Double
    public var low: Double
    public var close: Double
    
    init () {
        date = Date.init()
        open = 0.0
        high = 0.0
        low = 0.0
        close = 0.0
    }
}

struct TimeBucket {
    public var bucketHour : [Int]
    public var bucketStartDate : [Date]
    public var bucketEndDate : [Date]
    public var prices : [[Double]]
    
    init (tradeBin: [TOTradeBin], size: Int) {
        bucketHour = Array(repeating: 0, count: size)
        bucketStartDate = Array(repeating: Date.init(), count: size)
        bucketEndDate = Array(repeating: Date.init(), count: size)
        prices = Array(repeating: [0.0], count: size)
        var lastPrice = tradeBin[0].price
        
        for i in 0...size-1 {
            bucketHour[i] = i+1
            bucketStartDate[i] = bucketStartDate[size-1].addingTimeInterval(-180000.0+Double(i)*3600.0)
            bucketEndDate[i] = bucketStartDate[size-1].addingTimeInterval(-180000.0+Double(i+1)*3600.0)
            var firstLoop = true
            var hasValue = false
            
            for trade in tradeBin {
                let tradeDate = unixToDate(unixTimeStamp: trade.date)
                if tradeDate < bucketStartDate[i] { continue }
                if tradeDate >= bucketStartDate[i] && tradeDate < bucketEndDate[i] {
                    if firstLoop == true {
                        prices[i][0] = Double(trade.price)!
                        firstLoop = false
                    } else {
                        prices[i].append(Double(trade.price)!)
                    }
                } else {
                    
                }
            }
        }
        print(prices)
        
    }
    
    func unixToDate(unixTimeStamp: Int) -> Date {
        return Date(timeIntervalSince1970: Double(unixTimeStamp))
    }
}

