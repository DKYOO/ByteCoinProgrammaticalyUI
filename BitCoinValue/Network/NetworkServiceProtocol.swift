//
//  NetworkServiceProtocol.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 27.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    //MARK: Hello
    
    func performRequest(with urlString: String)
    
}
