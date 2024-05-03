//
//  PromotionsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 3.5.24..
//

import UIKit

extension PromotionsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PromotionsWireframe.createModule(PromotionsRef: self)
        
        let standardAppearance = UINavigationBarAppearance()
        let scrollAppearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))

        //appearance.configureWithOpaqueBackground()
        standardAppearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        standardAppearance.backgroundColor = AppColors.lightGrey
        standardAppearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)

        scrollAppearance.titleTextAttributes = [.foregroundColor: AppColors.white, .font : UIFont.inter(ofSize: 20, name: .bold)]
        scrollAppearance.backgroundColor = AppColors.brandPrimary
        scrollAppearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)

        navigationItem.standardAppearance = scrollAppearance
        navigationItem.scrollEdgeAppearance = standardAppearance
        
        self.navigationItem.title = LocalizedTitle.allPromotions.localized
        
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
