//
//  PromotionDetailsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 3.5.24..
//

import UIKit

extension PromotionDetailsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PromotionDetailsWireframe.createModule(PromotionDetailsRef: self)
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
    }
}
