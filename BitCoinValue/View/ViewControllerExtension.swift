//
//  ViewControllerExtension.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 28.04.2022.
//

import Foundation
import UIKit

extension ViewController: CoinManagerDelegate  {
    
    func getCurrencyTitle(model: NetworkingModel) {
        DispatchQueue.main.async {
            self.labelToStack.text = String(format: "%.2f", model.rate)
            self.labelToStack.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            self.labelToStack.textColor = .systemYellow
            self.imageToStack.tintColor = .systemPink
            self.labelHeader.startBlink()
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
    
    func changeLabelColor() {
        UIView.transition(with: labelHeader, duration: 0.25, options: .transitionCrossDissolve) {
            self.labelHeader.textColor = .red
            self.labelHeader.textColor = .systemPurple
        }
    }
    
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //PickerView Settings
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count;
    }
     // creating number of elemets in picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    // create connection with selection in picker view
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print (coinManager.currencyArray[row])
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
        
    }
}

//create Animation for UILabel 🤪

extension UILabel {

    func startBlink() {
        UIView.animate(withDuration: 0.8,
              delay:0.0,
              options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
              animations: { self.alpha = 0 },
              completion: nil)
    }

    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
}
