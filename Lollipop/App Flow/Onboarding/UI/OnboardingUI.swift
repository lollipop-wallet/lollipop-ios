//
//  OnboardingUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22/04/2024.
//

import UIKit

extension OnboardingView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        OnboardingWireframe.createModule(OnboardingRef: self)
    }
}
