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
    }
}
