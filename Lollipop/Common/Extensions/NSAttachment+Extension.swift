//
//  NSAttachment+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

extension NSTextAttachment {
    static func getCenteredImageAttachment(with imageName: String, and
                                           font: UIFont?, tintColor: UIColor) -> NSTextAttachment? {
        let imageAttachment = NSTextAttachment()
        guard let image = UIImage(named: imageName)?.withTintColor(tintColor),
        let font = font else { return nil }

    imageAttachment.bounds = CGRect(x: 0, y: (font.capHeight - image.size.height).rounded() / 2, width: image.size.width, height: image.size.height)
    imageAttachment.image = image
    return imageAttachment
    }
    
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height

        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}
