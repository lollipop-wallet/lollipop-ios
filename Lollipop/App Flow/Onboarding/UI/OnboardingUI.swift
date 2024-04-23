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
        
        self.pageViewController = PageView(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.pageViewController.dataSource = presenter
        self.pageViewController.delegate = presenter
    }
}
