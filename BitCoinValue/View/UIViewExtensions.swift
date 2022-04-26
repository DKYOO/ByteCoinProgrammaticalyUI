//
//  UIViewExtensions.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 25.04.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [Any]) {
        views.forEach { if let view = $0 as? UIView {
                self.addSubview(view)
            }
        }
    }
}
