//
//  JSONStructures.swift
//  tradr
//
//  Created by William Ravenscroft on 09/05/2018.
//  Copyright © 2018 ZypherFX. All rights reserved.
//

import Foundation

struct TOTicker : Decodable {
    public var success : Bool
    public var initialprice : String
    public var price : String
    public var high : String
    public var low : String
    public var volume : String
    public var bid : String
    public var ask : String
}

struct MCTicker : Codable {
    public var at : Int?
    struct ticker : Codable {
        public var buy : Double?
        public var sell : Double?
        public var low : Double?
        public var high : Double?
        public var last : Double?
        public var vol : Double?
        public var volbtc : Double?
        public var change : Double?
    }
}