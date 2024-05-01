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
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.myCards.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        lazy var doneButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.title = LocalizedTitle.sort.localized
            button.tintColor = AppColors.link
            button.action = #selector(self.onDoneTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        self.navigationItem.rightBarButtonItems = [doneButton]
    }
}
