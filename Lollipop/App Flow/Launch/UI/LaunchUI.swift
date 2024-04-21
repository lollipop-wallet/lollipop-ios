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
        self.view.backgroundColor = .red
    }
}
