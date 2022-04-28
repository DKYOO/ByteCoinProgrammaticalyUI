//
//  CoinManager.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 16.04.2022.
//

import Foundation
import UIKit

protocol CoinManagerDelegate {
	func getCurrencyTitle(model: NetworkingModel)
	func getBitcoinValue(model: NetworkingModel)
	func didFailWithError(error: Error)
	
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
					if let bitcoinPrice = self.parseJSON(safeData) {
						delegate?.getBitcoinValue(model: bitcoinPrice)
						delegate?.getCurrencyTitle(model: bitcoinPrice)
					}
				}
			}
			task.resume()
		}
	}
	
	func parseJSON(_ data: Data) -> NetworkingModel?  {
		let decoder = JSONDecoder()
		
		do {
			let decodedData = try decoder.decode(NetworkingModel.self, from: data)
			let currency = decodedData.asset_id_quote
			let value = decodedData.asset_id_base
			let lastPrice = decodedData.rate
			
			
			let datas = NetworkingModel(asset_id_base: currency, asset_id_quote: value, rate: lastPrice)
			
			return datas
//			print(lastPrice)
//			return lastPrice
		} catch {
			delegate?.didFailWithError(error: error)
			print (error)
			return nil
		}
	}
	
}



