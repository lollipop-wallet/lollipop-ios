//
//  LocationsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit

extension LocationsFilterView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        LocationsFilterWireframe.createModule(LocationsFilterRef: self)
        
        lazy var upperPullBar: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 2
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.darkGrey
            return view
        }()
        
        self.view.addSubview(upperPullBar)
        upperPullBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
    }
}
