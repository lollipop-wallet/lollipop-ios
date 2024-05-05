//
//  LocationsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 05/05/2024.
//

import UIKit

extension LocationsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        LocationsWireframe.createModule(LocationsRef: self)
    }
}
