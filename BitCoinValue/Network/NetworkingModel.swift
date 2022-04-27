//
//  NetworkingModel.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 27.04.2022.
//

import Foundation

struct NetworkingModel: Decodable {
    var time: String?
    //crypto currency
    var asset_id_base: String?
    //currency like a $
    var asset_id_quote: String?
    //value crypto->currency
    var rate: Double
    //poxui
    var src_side_base: BullShitModel?
}

struct BullShitModel: Decodable {
    var time: String?
}
