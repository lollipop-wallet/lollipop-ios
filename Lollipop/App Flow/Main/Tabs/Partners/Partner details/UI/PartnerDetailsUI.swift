//
//  PartnerDetailsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit

extension PartnerDetailsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PartnerDetailsWireframe.createModule(PartnerDetailsRef: self)
    }
}
