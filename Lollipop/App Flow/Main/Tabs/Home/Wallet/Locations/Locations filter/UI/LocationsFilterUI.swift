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
    }
}
