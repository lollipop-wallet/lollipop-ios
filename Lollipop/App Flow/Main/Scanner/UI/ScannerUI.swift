//
//  ScannerUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

extension ScannerView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ScannerWireframe.createModule(ScannerRef: self)
        
        self.view.addSubview(self.scannerContainerView)
        self.scannerContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(400)
        }
    }
}
