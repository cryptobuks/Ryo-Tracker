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

struct HourlyTimeBucket {
    public var bucketHour : [Int]
    public var bucketStartDate : [Date]
    public var bucketEndDate : [Date]
    public var pricesBin : [[Double]]
    
    init (tradeBin: [TOTradeBin], size: Int) {
        bucketHour = Array(repeating: 0, count: size)
        bucketStartDate = Array(repeating: Date.init().addingTimeInterval(-3600.0), count: size)
        bucketEndDate = Array(repeating: Date.init(), count: size)
        pricesBin = Array(repeating: [0.0], count: size)
        let timeScale = -Double((size-1)*3600)
        
        for i in 0...size-1 {
            bucketHour[i] = i+1
            bucketStartDate[i] = bucketStartDate[size-1].addingTimeInterval(timeScale+Double(i)*3600.0)
            bucketEndDate[i] = bucketEndDate[size-1].addingTimeInterval(timeScale+Double(i)*3600.0)
            var firstLoop = true
            
            for trade in tradeBin {
                let tradeDate = unixToDate(unixTimeStamp: trade.date)
                if tradeDate < bucketStartDate[i] { continue }
                if tradeDate >= bucketEndDate[i] { continue }
                if tradeDate >= bucketStartDate[i] && tradeDate < bucketEndDate[i] {
                    if firstLoop == true {
                        pricesBin[i][0] = Double(trade.price)!
                        firstLoop = false
                    } else {
                        pricesBin[i].append(Double(trade.price)!)
                    }
                } else {
                    
                }
            }
        }
        
        //Find the first price if the first time bin is empty
        let firstPrice: Double
        var isFirstBinEmpty = (pricesBin[0] == [0.0])
        if isFirstBinEmpty == true {
            for prices in pricesBin {
                if prices == [0.0] { continue }
                if prices != [0.0] {
                    firstPrice = prices[0]
                    break
                }
            }
            pricesBin[0][0] = firstPrice
        } else {
            firstPrice = pricesBin[0][0]
        }
        
    }
    
    func unixToDate(unixTimeStamp: Int) -> Date {
        return Date(timeIntervalSince1970: Double(unixTimeStamp))
    }
    
    func removeZeros(input: [[Double]]) -> [[Double]] {
        for i in 0...input.count-1 {
            if input[i] == [0.0] {
                input[i] = input[i][0]
            }
        }
    }
}


