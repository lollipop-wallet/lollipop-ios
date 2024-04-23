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
        self.artworkImageView.contentMode = .scaleAspectFit
        
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
        
        self.view.addSubview(self.artworkImageView)
        self.artworkImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(114)
        }
        
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(self.artworkImageView.snp.bottom).offset(24)
        }
        
        self.view.addSubview(self.subtitleLabel)
        self.subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
        }
        
        self.view.addSubview(self.proceedView)
        self.proceedView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-61)
            make.height.equalTo(48)
        }
    }
}
