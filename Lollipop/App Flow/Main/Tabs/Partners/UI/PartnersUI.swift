//
//  PartnersUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension PartnersView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PartnersWireframe.createModule(PartnersRef: self)
    }
}
