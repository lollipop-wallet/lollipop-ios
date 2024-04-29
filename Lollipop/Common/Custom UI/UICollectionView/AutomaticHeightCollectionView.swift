//
//  AutomaticHeightCollectionView.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29/04/2024.
//

import UIKit

class AutomaticHeightCollectionView: UICollectionView {

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        let s = self.collectionViewLayout.collectionViewContentSize
        return CGSize(width: max(s.width, 1), height: max(s.height,1))
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         if !(__CGSizeEqualToSize(bounds.size,self.intrinsicContentSize)){
             self.invalidateIntrinsicContentSize()
         }
     }
}
