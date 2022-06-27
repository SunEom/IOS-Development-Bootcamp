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
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinData)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)\(currency)/USD?apikey=\(ProcessInfo.processInfo.environment["APIKEY"]!)"
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        let url = URL(string: urlString)
        
        if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: { data, repsonse, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coin: coin)
                        return
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            return decodedData
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
