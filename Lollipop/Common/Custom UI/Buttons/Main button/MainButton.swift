//
//  MainButton.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 25/04/2024.
//

import UIKit

class MainButton: UIButton {
    
    open var title: String? {
        set { self.setTitle(newValue ?? "", for: .normal)}
        get { return "" }
    }
    
    required init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
}
