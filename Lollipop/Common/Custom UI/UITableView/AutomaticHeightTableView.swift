//
//  AutomaticHeightTableView.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//

import UIKit

class AutomaticHeightTableView: UITableView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
