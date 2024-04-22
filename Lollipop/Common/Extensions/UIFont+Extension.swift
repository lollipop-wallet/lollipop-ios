//
//  UIFont+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

extension UIFont {

    var withSmallCaps: UIFont {
        let upperCaseFeature = [
            UIFontDescriptor.FeatureKey.type : kUpperCaseType,
            UIFontDescriptor.FeatureKey.selector : kUpperCaseSmallCapsSelector
        ]
        let lowerCaseFeature = [
            UIFontDescriptor.FeatureKey.type : kLowerCaseType,
            UIFontDescriptor.FeatureKey.selector : kLowerCaseSmallCapsSelector
        ]
        let features = [upperCaseFeature, lowerCaseFeature]
        let smallCapsDescriptor = self.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.featureSettings : features])
        return UIFont(descriptor: smallCapsDescriptor, size: pointSize)
    }
    
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)

        guard #available(iOS 13.0, *), let descriptor = systemFont.fontDescriptor.withDesign(.rounded) else { return systemFont }
        return UIFont(descriptor: descriptor, size: size)
    }
    
    class func inter(ofSize size: CGFloat, name: AppFontWeight) -> UIFont {
        let font = UIFont(name: name.rawValue, size: size)!
        return font
    }
}
