//
//  RoundedImageView.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 01/06/2024.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.height/2
    }
}
