//
//  Int+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
