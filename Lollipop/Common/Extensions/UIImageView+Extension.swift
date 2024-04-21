//
//  UIImageView+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation
import Kingfisher

extension UIImageView {
    public func imageFromURL(url: String) {
        let imgUrl = URL(string: url)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imgUrl)
    }
}
