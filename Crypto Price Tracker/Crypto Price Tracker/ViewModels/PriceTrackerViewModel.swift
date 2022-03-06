//
//  PriceTrackerViewModel.swift
//  Crypto Price Tracker
//
//  Created by Mutlu Çalkan on 6.03.2022.
//

import Foundation

class PriceTrackerViewModel {
    
    func priceFormat(_ price: Prices) -> String {
        return String(format: "%@ %.4f", price.unit, price.value)
    }
    
    
    func dateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM y HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
