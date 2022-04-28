//
//  ViewControllerExtension.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 28.04.2022.
//

import Foundation
import UIKit

extension ViewController: CoinManagerDelegate  {
//    
//    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//        
//        DispatchQueue.main.async {
//            self.temratureCountLabel.text = weather.tempratureString
//            self.weatherTypeImage.image = UIImage(systemName: weather.conditionName)
//            self.cityNameLabel.text = weather.cityName
//        }
//        
//    }
    
    func getCurrencyTitle(model: NetworkingModel) {
        DispatchQueue.main.async {
            self.labelToStack.text = String(format: "%.2f", model.rate)
            self.labelToStack.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            self.labelToStack.textColor = .systemYellow
            self.imageToStack.tintColor = .systemPink
        }
    }
    
    func getBitcoinValue(model: NetworkingModel) {
        DispatchQueue.main.async {
            self.currencyLabelToStack.text = model.asset_id_base
            self.currencyLabelToStack.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            self.currencyLabelToStack.textColor = .purple
        }
    }
    
    func didFailWithError(error: Error) {
        print (error)
    }
    
}
