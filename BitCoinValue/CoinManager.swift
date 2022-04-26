//
//  CoinManager.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 16.04.2022.
//

import Foundation

struct CoinManager {
    
    let baseURL  = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ""
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
	
	//hmmm this is getter 🤔
	
	func getCoinPrice(for currency: String) {
		
	}
}
