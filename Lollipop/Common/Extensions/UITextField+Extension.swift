//
//  UITextField+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

extension UITextField {
    func phoneText()->String{
        if self.text?.substring(to: 1) == "0" {
            return String(self.text?.dropFirst() ?? "")
        }else{
            return self.text ?? ""
        }
    }
    
    func placeholderColor(color: UIColor) {
        let placeholder = self.placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}
