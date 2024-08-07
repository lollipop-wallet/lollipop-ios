//
//  ContentViewUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22/04/2024.
//

import UIKit

extension ContentView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        self.artworkImageView.contentMode = .scaleAspectFill
        self.artworkImageView.clipsToBounds = true
        
        let device = UIDevice.current.dc.deviceModel
        
        var topDistance = 114
        var bottomDistance = -61
        
        switch device {
        case .iPhone6, .iPhone6S, .iPhone6Plus, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .iPhoneSE2, .iPhoneSE3:
            topDistance = 54
            bottomDistance = -21
        default:
            topDistance = 114
            bottomDistance = -61
        }
        
        self.titleLabel.font = .inter(ofSize: 30.0, name: .bold)
        self.titleLabel.textColor = AppColors.black
        self.titleLabel.textAlignment = .left
        self.titleLabel.numberOfLines = 0
        self.titleLabel.lineBreakMode = .byWordWrapping
        
        self.subtitleLabel.font = .inter(ofSize: 16.0, name: .regular)
        self.subtitleLabel.textColor = AppColors.black
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.lineBreakMode = .byWordWrapping
        
        self.proceedLabel.font = .inter(ofSize: 16, name: .medium)
        self.proceedLabel.textAlignment = .center
        
        lazy var proceedButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onProceedTap), for: .touchUpInside)
            return button
        }()
        
        self.proceedView.addSubview(self.proceedLabel)
        self.proceedLabel.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.proceedView.addSubview(proceedButton)
        proceedButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        lazy var curvedBottomPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(self.titleLabel)
            self.titleLabel.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            
            view.addSubview(self.subtitleLabel)
            self.subtitleLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            }
            
            view.addSubview(self.proceedView)
            self.proceedView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalToSuperview().offset(bottomDistance)
                make.height.equalTo(48)
            }
            
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            return view
        }()
        
        self.view.addSubview(self.artworkImageView)
        self.artworkImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.view.addSubview(curvedBottomPlaceholderView)
        curvedBottomPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(self.view.frame.width * 0.98)
        }
    }
}
