//
//  ScanSuggestionUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

extension ScanSuggestionView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ScanSuggestionWireframe.createModule(ScanSuggestionRef: self)
    }
}
