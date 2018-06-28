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
    
    // Ticker labels
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bidLabel: UILabel!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    //
    var toTicker: TOTicker!
    private var percentChange = 0.0
    @IBOutlet weak var changeLabel: UILabel!
    //var positiveColor = UIColor.green
    //var negativeColor = UIColor.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //var positiveColor = changeLabel.textColor
        //var negativeColor = UIColor.red
        
        // Send HTTP requests every 10 seconds to update data
        requestTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            //
            HTTPRequest.requestTicker(exchange: self.exchange.getExchange(), url: self.exchange.getTickerURL()) {ticker in
                if self.exchange.getExchange() == exchangeVal.tradeogre.rawValue {
                    let toTicker = ticker as! TOTicker
                    self.priceLabel.text = "฿ "+toTicker.price
                    self.bidLabel.text = "฿ "+toTicker.bid
                    self.askLabel.text = "฿ "+toTicker.ask
                    self.highLabel.text = "฿ "+toTicker.high
                    self.lowLabel.text = "฿ "+toTicker.low
                    self.volumeLabel.text = "฿ "+toTicker.volume
                    let tPrice = Double(toTicker.price)!
                    let tInitialPrice = Double(toTicker.initialprice)!
                    
                    self.percentChange = 100.0*(tPrice/tInitialPrice-1.0)
                    if self.percentChange >= 0 {
                        self.changeLabel.text = String("+" + String(format: "%.2f",self.percentChange) + "%")
                        //self.changeLabel.textColor = positiveColor
                        
                    } else {
                        self.changeLabel.text = String(String(self.percentChange) + "%")
                        //self.changeLabel.textColor = negativeColor
                    }
                    
                }
            }
            HTTPRequest.requestTradeBin(exchange: self.exchange.getExchange(), url: self.exchange.getTradeBinURL()) { tradeBin in
                if self.exchange.getExchange() == exchangeVal.tradeogre.rawValue {
                    //let toTradeBin = tradeBin as! TOTradeBin
                    
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

