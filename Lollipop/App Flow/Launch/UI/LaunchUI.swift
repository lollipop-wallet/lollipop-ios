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
        
        self.view.addSubview(lollipopIcon)
        lollipopIcon.snp.makeConstraints { make in
            make.width.height.equalTo(104)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
