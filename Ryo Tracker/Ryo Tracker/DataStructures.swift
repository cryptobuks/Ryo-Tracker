//
//  DataStructures.swift
//  Ryo Tracker
//
//  Created by Will Ravenscroft on 26/06/2018.
//  Copyright © 2018 Zypher DX. All rights reserved.
//

import Foundation

struct ohlcForm {
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

struct timeBuckets {
    public var bucketHour : Int
    public var bucketDate : Date
    public var prices : [Double]
}

