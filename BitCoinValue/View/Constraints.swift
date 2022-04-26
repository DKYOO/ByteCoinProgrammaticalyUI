//
//  Constraints.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 17.04.2022.
//

import Foundation
import UIKit

extension ViewController {
    
    //build constraints to ALL UIElements
    func buildConstraints() {
        NSLayoutConstraint.activate([
        
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor),
            headerStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerStackView.heightAnchor.constraint(equalToConstant: 200),
            
//            labelHeader.topAnchor.constraint(equalTo: headerStackView.topAnchor),
//            labelHeader.leftAnchor.constraint(equalTo: headerStackView.leftAnchor, constant: 100),
//            labelHeader.rightAnchor.constraint(equalTo: headerStackView.rightAnchor),
//            labelHeader.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor),
//            
//            labelHeader.widthAnchor.constraint(equalToConstant: 60),
//            labelHeader.heightAnchor.constraint(equalToConstant: 230),
//            
            
            middleStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            middleStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            middleStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            middleStackView.heightAnchor.constraint(equalToConstant: 100),
            
            pickerView.heightAnchor.constraint(equalToConstant: 216),
            pickerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        
        ])
    }
}
