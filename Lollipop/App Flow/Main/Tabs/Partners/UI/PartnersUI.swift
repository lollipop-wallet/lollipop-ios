//
//  PartnersUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension PartnersView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PartnersWireframe.createModule(PartnersRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.ourPartners.localized
        
        lazy var segmentedControl: CustomSegmentedControl = {
            let control = CustomSegmentedControl(items: [LocalizedTitle.all.localized, LocalizedTitle.favorite.localized])
            control.selectedSegmentIndex = 0
            control.selectedSegmentTintColor = AppColors.brandPrimary
            control.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
            control.setTitleTextAttributes([.foregroundColor: AppColors.darkGrey, NSAttributedString.Key.font: UIFont.inter(ofSize: 14, name: .semibold)], for: .normal)
            control.setTitleTextAttributes([.foregroundColor: AppColors.white, NSAttributedString.Key.font:  UIFont.inter(ofSize: 14, name: .semibold)], for: .selected)
            
            
//            control.setBackgroundImage(UIImage(color: AppColors.brandPrimary), for: .selected, barMetrics: .default)
//            //control.setBackgroundImage(UIImage(color: AppColors.brandPrimary.withAlphaComponent(0.2)), for: .highlighted, barMetrics: .default)
//            control.setBackgroundImage(UIImage(color: AppColors.error), for: [.highlighted, .selected], barMetrics: .default)
            
            return control
        }()
        
        self.view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.height.equalTo(47)
        }
    }
}

extension UISegmentedControl
{
    func setOldLayout(tintColor: UIColor)
    {
        if #available(iOS 13, *)
        {
            let bg = UIImage(color: .clear, size: CGSize(width: 1, height: 32))
             let devider = UIImage(color: tintColor, size: CGSize(width: 1, height: 32))

             //set background images
             self.setBackgroundImage(bg, for: .normal, barMetrics: .default)
             //self.setBackgroundImage(devider, for: .selected, barMetrics: .default)

             //set divider color
             //self.setDividerImage(devider, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

             //set border
             self.layer.borderWidth = 4
             self.layer.borderColor = tintColor.cgColor

             //set label color
            self.setTitleTextAttributes([.foregroundColor: AppColors.darkGrey], for: .normal)
             self.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        }
        else
        {
            self.tintColor = tintColor
        }
    }
}


class CustomSegmentedControl: UISegmentedControl{
    private let segmentInset: CGFloat = 6     //your inset amount
    private let segmentImage: UIImage? = UIImage(color: AppColors.brandPrimary)    //your color

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
    }
}
