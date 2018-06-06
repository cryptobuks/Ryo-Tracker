//
//  JSONStructures.swift
//  tradr
//
//  Created by William Ravenscroft on 09/05/2018.
//  Copyright © 2018 ZypherFX. All rights reserved.
//

import Foundation

struct TradeBin : Codable {
    public var timestamp: String
    public var symbol: String
    public var open: Double?
    public var high: Double?
    public var low: Double?
    public var close: Double?
    public var trades: Double?
    public var volume: Double?
    public var vwap: Double?
    public var lastSize: Double?
    public var turnover: Double?
    public var homeNotional: Double?
    public var foreignNotional: Double?
    
}

struct Instrument : Codable {
    public var symbol: String
    public var rootSymbol: String?
    public var state: String?
    public var typ: String?
    public var listing: String?
    public var front: String?
    public var expiry: String?
    public var settle: String?
    public var relistInterval: String?
    public var inverseLeg: String?
    public var sellLeg: String?
    public var buyLeg: String?
    public var positionCurrency: String?
    public var underlying: String?
    public var quoteCurrency: String?
    public var underlyingSymbol: String?
    public var reference: String?
    public var referenceSymbol: String?
    public var calcInterval: String?
    public var publishInterval: String?
    public var publishTime: String?
    public var maxOrderQty: Double?
    public var maxPrice: Double?
    public var lotSize: Double?
    public var tickSize: Double?
    public var multiplier: Double?
    public var settlCurrency: String?
    public var underlyingToPositionMultiplier: Double?
    public var underlyingToSettleMultiplier: Double?
    public var quoteToSettleMultiplier: Double?
    public var isQuanto: Bool?
    public var isInverse: Bool?
    public var initMargin: Double?
    public var maintMargin: Double?
    public var riskLimit: Double?
    public var riskStep: Double?
    public var limit: Double?
    public var capped: Bool?
    public var taxed: Bool?
    public var deleverage: Bool?
    public var makerFee: Double?
    public var takerFee: Double?
    public var settlementFee: Double?
    public var insuranceFee: Double?
    public var fundingBaseSymbol: String?
    public var fundingQuoteSymbol: String?
    public var fundingPremiumSymbol: String?
    public var fundingTimestamp: String?
    public var fundingInterval: String?
    public var fundingRate: Double?
    public var indicativeFundingRate: Double?
    public var rebalanceTimestamp: String?
    public var rebalanceInterval: String?
    public var openingTimestamp: String?
    public var closingTimestamp: String?
    public var sessionInterval: String?
    public var prevClosePrice: Double?
    public var limitDownPrice: Double?
    public var limitUpPrice: Double?
    public var bankruptLimitDownPrice: Double?
    public var bankruptLimitUpPrice: Double?
    public var prevTotalVolume: Double?
    public var totalVolume: Double?
    public var volume: Double?
    public var volume24h: Double?
    public var prevTotalTurnover: Double?
    public var totalTurnover: Double?
    public var turnover: Double?
    public var turnover24h: Double?
    public var prevPrice24h: Double?
    public var vwap: Double?
    public var highPrice: Double?
    public var lowPrice: Double?
    public var lastPrice: Double?
    public var lastPriceProtected: Double?
    public var lastTickDirection: String?
    public var lastChangePcnt: Double?
    public var bidPrice: Double?
    public var midPrice: Double?
    public var askPrice: Double?
    public var impactBidPrice: Double?
    public var impactMidPrice: Double?
    public var impactAskPrice: Double?
    public var hasLiquidity: Bool?
    public var openInterest: Double?
    public var openValue: Double?
    public var fairMethod: String?
    public var fairBasisRate: Double?
    public var fairBasis: Double?
    public var fairPrice: Double?
    public var markMethod: String?
    public var markPrice: Double?
    public var indicativeTaxRate: Double?
    public var indicativeSettlePrice: Double?
    public var settledPrice: Double?
    public var timestamp: String?
}
