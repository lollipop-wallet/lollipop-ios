//
//  MainUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension MainView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        MainWireframe.createModule(MainRef: self)
        
        self.tabBar.tintColor = AppColors.brandPrimary
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = DefaultModels().unselected[i]
                let imageNameForUnselectedState = DefaultModels().selected[i]
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysTemplate)
                self.tabBar.items?[i].image = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
    }
}
