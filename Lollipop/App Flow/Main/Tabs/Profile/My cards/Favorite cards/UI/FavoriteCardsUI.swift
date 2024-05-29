//
//  FavoriteCardsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29/05/2024.
//

import UIKit

extension FavoriteCardsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        FavoriteCardsWireframe.createModule(FavoriteCardsRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        appearance.backgroundColor = AppColors.lightGrey
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.myCards.localized
        
        lazy var subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.text = LocalizedTitle.markFavoriteCards.localized
            return label
        }()
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

