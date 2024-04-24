//
//  LaunchUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit
import SnapKit

extension LaunchView {
    func setup() {
        LaunchWireframe.createModule(LaunchRef: self)
        self.view.backgroundColor = AppColors.brandPrimary
        
        lazy var lollipopIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.splashIcon)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        lazy var input: CalendarInputField = {
            let field = CalendarInputField()
            field.title = "dwadwa"
            field.error = "dddd"
            field.text = LocalizedTitle.choose.localized
            field.background = AppColors.white
            field.rightSuplementaryIcon = UIImage(named: AssetTitles.calendarIcon)
            field.rightSuplementaryIconTintColor = AppColors.darkGrey
            field.rightSuplementaryIconHidden = false
            field.errorHidden = true
            return field
        }()
//        self.view.addSubview(lollipopIcon)
//        lollipopIcon.snp.makeConstraints { make in
//            make.width.height.equalTo(104)
//            make.centerX.centerY.equalToSuperview()
//        }
        
        self.view.addSubview(input)
        input.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.centerY.equalToSuperview()
        }
    }
}
