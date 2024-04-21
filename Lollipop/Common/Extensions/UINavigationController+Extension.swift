//
//  UINavigationController+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

extension UINavigationController {
    func setBackButton() {
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        self.navigationBar.backIndicatorImage = imgBackArrow
        self.navigationBar.backIndicatorTransitionMaskImage = imgBackArrow
        self.navigationItem.leftItemsSupplementBackButton = true
    }
}
