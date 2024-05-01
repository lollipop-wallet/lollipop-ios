//
//  EditCardUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 1.5.24..
//

import UIKit

extension EditCardView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        EditCardWireframe.createModule(EditCardRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.cardDetails.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        lazy var deleteButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.title = LocalizedTitle.delete.localized
            button.tintColor = AppColors.error
            button.action = #selector(self.onDeleteTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        self.navigationItem.rightBarButtonItems = [deleteButton]
    }
}
