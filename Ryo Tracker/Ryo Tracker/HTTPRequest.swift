//
//  HTTPRequests.swift
//  tradr
//
//  Created by William Ravenscroft on 09/05/2018.
//  Copyright © 2018 ZypherFX. All rights reserved.
//

import Foundation
import Alamofire

class HTTPRequest {
    
    //Trade bin constants
    
    
    static func requestTradeBins(symbol: String, interval: String, count: Int, tradeBinResponse: @escaping ([TradeBin]) -> Void){
        let url = String("https://testnet.bitmex.com/api/v1/trade/bucketed?symbol=" + symbol + "&count=" + String(count) + "&reverse=true&partial=false&binSize=" + interval)
        Alamofire.request(url).responseString { response in
            
            let decoder = JSONDecoder()
            let jsonString = response.result.value
            let jsonData = jsonString!.data(using: .utf8)!
            let tradeBins = try! decoder.decode([TradeBin].self, from: jsonData)
        
            tradeBinResponse(tradeBins)
        }
    }
    
    // Request all information for current instrument
    static func requestInstrument(symbol: String, instrumentResponse: @escaping ([Instrument]) -> Void) {
        
        Alamofire.request("https://testnet.bitmex.com/api/v1/instrument?symbol=" + symbol + "&reverse=false").responseString { response in
            
            let decoder = JSONDecoder()
            let jsonString = response.result.value
            let jsonData = jsonString!.data(using: .utf8)!
            let instruments = try! decoder.decode([Instrument].self, from: jsonData)
            
            instrumentResponse(instruments)
        }
        
    }
}
