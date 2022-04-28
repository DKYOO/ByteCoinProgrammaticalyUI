//
//  CoinManager.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 16.04.2022.
//

import Foundation
import UIKit

protocol CoinManagerDelegate {
	 func getLastPrice()
}

struct CoinManager {
	
	var delegate: CoinManagerDelegate?
	
	let baseURL  = "https://rest.coinapi.io/v1/exchangerate/BTC"
	
	private let apiKey = "C80B9225-C38E-44A6-B2C5-7BB81DBC3DD7"
	
	let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
	
	//hmmm this is getter 🤔
	
	func getCoinPrice(for currency: String) {
		let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
		print (urlString)
		performRequest(urlString: urlString)
	}
	
	func performRequest(urlString: String) {
		
		if let url = URL(string: urlString) {
			
			//configurate session
			let session = URLSession(configuration: .default)
			
			//Give a Task
			
			let task = session.dataTask(with: url) { (data, response, error) in
				if error != nil {
					print (error!)
					return
				}
				if let safeData = data {
					let bitcoinPrice = self.parseJSON(safeData)
				}
			}
			task.resume()
		}
	}
	
	func parseJSON(_ data: Data) -> Double?  {
		let decoder = JSONDecoder()
		
		do {
			let decodedData = try decoder.decode(NetworkingModel.self, from: data)
			let lastPrice = decodedData.rate
			print(lastPrice)
			return lastPrice
		} catch {
			print (error)
			return nil
		}
	}
}



