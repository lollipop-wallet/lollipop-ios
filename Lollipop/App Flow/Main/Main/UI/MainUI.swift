//
//  MainUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension MainView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        MainWireframe.createModule(MainRef: self)
        
        let device = UIDevice.current.dc.deviceModel
        var bottomDistance = -21
        

        switch device {
        case .iPhone6, .iPhone6S, .iPhone6Plus, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .iPhoneSE2, .iPhoneSE3, .unknown:
            bottomDistance = 5
        default:
            bottomDistance = -21
        }
        
        self.tabBar.tintColor = AppColors.brandPrimary
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = DefaultModels().unselected[i]
                let imageNameForUnselectedState = DefaultModels().selected[i]
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysTemplate)
                self.tabBar.items?[i].image = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        lazy var scanButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onScanTap), for: .touchUpInside)
            button.setImage(UIImage(named: AssetTitles.mainScanIcon), for: .normal)
            return button
        }()
        
        
        self.view.addSubview(scanButton)
        scanButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
            make.bottom.equalToSuperview().offset(bottomDistance)
        }
    }
}
