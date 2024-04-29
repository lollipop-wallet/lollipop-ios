//
//  CustomSegmentedControl.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29.4.24..
//

import UIKit

class CustomSegmentedControl: UISegmentedControl{
    open var segmentInset: CGFloat = 6     //your inset amount
    open var segmentImage: UIImage? = UIImage(color: AppColors.brandPrimary)    //your color

    override func layoutSubviews(){
        super.layoutSubviews()

        //background
        layer.cornerRadius = 12
        //foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView
        {
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage    //substitute with our own colored image
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")    //this removes the weird scaling animation!
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = 8
        }
        
        (0..<numberOfSegments).forEach { index in
            if let subview = subviews[index] as? UIImageView {
                subview.isHidden = true
            }
        }
    }
}
