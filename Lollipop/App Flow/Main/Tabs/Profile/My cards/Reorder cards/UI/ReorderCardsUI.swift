//
//  ReorderCardsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 01/05/2024.
//

import UIKit

extension ReorderCardsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ReorderCardsWireframe.createModule(ReorderCardsRef: self)
    }
}
