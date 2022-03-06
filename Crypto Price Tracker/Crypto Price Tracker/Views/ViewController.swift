//
//  ViewController.swift
//  Crypto Price Tracker
//
//  Created by Mutlu Çalkan on 6.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btcPrice: UILabel!
    @IBOutlet weak var ethPrice: UILabel!
    @IBOutlet weak var bnbPrice: UILabel!
    @IBOutlet weak var dotPrice: UILabel!
    @IBOutlet weak var usdPrice: UILabel!
    @IBOutlet weak var eurPrice: UILabel!
    @IBOutlet weak var lastUpdate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: true)

    }
    
    @objc func timerSelector() -> Void{
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://api.coingecko.com/api/v3/exchange_rates")
        URLSession.shared.dataTask(with: url!) {data, response, error in
            if (error != nil){
                print(error as Any)
                return
            }
            do {
                let json = try JSONDecoder().decode(Rates.self, from: data!)
                self.setPrices(currency: json.rates)
            } catch {
                print(error)
                return
            }
        }.resume()

    }
    
    func setPrices(currency: Currency) {
        DispatchQueue.main.async {
            self.btcPrice.text = PriceTrackerViewModel().priceFormat(currency.btc)
            self.ethPrice.text = PriceTrackerViewModel().priceFormat(currency.eth)
            self.bnbPrice.text = PriceTrackerViewModel().priceFormat(currency.bnb)
            self.dotPrice.text = PriceTrackerViewModel().priceFormat(currency.dot)
            self.usdPrice.text = PriceTrackerViewModel().priceFormat(currency.usd)
            self.eurPrice.text = PriceTrackerViewModel().priceFormat(currency.eur)
            self.lastUpdate.text = PriceTrackerViewModel().dateFormat(date: Date())
        }
    }
}


