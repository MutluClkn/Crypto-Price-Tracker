//
//  Currencies.swift
//  Crypto Price Tracker
//
//  Created by Mutlu Çalkan on 6.03.2022.
//

import Foundation

struct Rates: Codable {
    let rates: Currency
}

struct Currency: Codable {
    let btc: Prices
    let eth: Prices
    let bnb: Prices
    let dot: Prices
    let usd: Prices
    let eur: Prices
}

struct Prices: Codable {
    let name: String
    let unit: String
    let value: Float
    let type: String
}
