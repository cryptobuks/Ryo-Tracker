//
//  ViewController.swift
//  Ryo Tracker
//
//  Created by Will Ravenscroft on 06/06/2018.
//  Copyright © 2018 Zypher DX. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var candleStickChartView: CandleStickChartView!
    private var exchange = Exchange.init()
    fileprivate var requestTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(exchange.getTickerURL())
        
        // Send HTTP requests every 10 seconds to update data
        requestTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            //
            HTTPRequest.requestTicker(exchange: self.exchange.getExchange(), url: self.exchange.getTickerURL()) {ticker in
                if self.exchange.getExchange() == exchangeVal.tradeogre.rawValue {
                    var toTicker = ticker as!TOTicker)
                }
            }
            
        }
        
        requestTimer!.fire()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   


}

