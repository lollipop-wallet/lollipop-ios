//
//  PartnersUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension PartnersView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PartnersWireframe.createModule(PartnersRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.ourPartners.localized
        
        lazy var segmentedControl: CustomSegmentedControl = {
            let control = CustomSegmentedControl(items: [LocalizedTitle.all.localized, LocalizedTitle.favorite.localized])
            control.selectedSegmentIndex = 0
            control.backgroundColor = AppColors.white
            control.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
            control.setTitleTextAttributes([.foregroundColor: AppColors.darkGrey, NSAttributedString.Key.font: UIFont.inter(ofSize: 14, name: .semibold)], for: .normal)
            control.setTitleTextAttributes([.foregroundColor: AppColors.white, NSAttributedString.Key.font:  UIFont.inter(ofSize: 14, name: .semibold)], for: .selected)
            return control
        }()
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        self.view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.height.equalTo(47)
        }
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

