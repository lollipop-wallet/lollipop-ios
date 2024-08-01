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
        
//        self.view.addSubview(lollipopIcon)
//        lollipopIcon.snp.makeConstraints { make in
//            make.width.equalTo(224)
//            make.height.equalTo(62)
//            make.centerX.centerY.equalToSuperview()
//        }
        self.animationView = .init(name: "splash_screen")
        self.animationView?.contentMode = .scaleAspectFill
        self.animationView?.loopMode = .playOnce
        
        self.view.addSubview(self.animationView ?? UIView())
        (self.animationView ?? UIView()).snp.makeConstraints({ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        })
        
        self.animationView?.play()
    }
}
