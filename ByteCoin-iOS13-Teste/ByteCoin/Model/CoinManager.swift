//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateRate(rate: Double)
    func didUpdateCoin(_ coinName: String)
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "79D45437-57F0-45F1-B9CC-405B5EE480BC"
    var delegate: CoinManagerDelegate?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let coinName = currency
        self.delegate?.didUpdateCoin(coinName)
        if let url = URL(string: "\(baseURL)/\(coinName)?apikey=\(apiKey)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        parseJSON(data)
                    } catch {
                        self.delegate?.didFailWithError(error: error)
                    }
                }
            }
        task.resume()
        }
    }

    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let rate = decodedData.rate
            print(rate)
            self.delegate?.didUpdateRate(rate: rate)
        } catch {
            self.delegate?.didFailWithError(error: error)
        }
    }
}
