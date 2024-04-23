//
//  SignInUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 23.4.24..
//

import UIKit

extension SignInView {
    func setup() {
        SignInWireframe.createModule(SignInRef: self)
        
        lazy var backgroundImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.signInBackgroundIcon)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        lazy var lollipopImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.splashIcon)
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(48)
            }
            return imageView
        }()
        
        lazy var lollipopLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 24, name: .bold)
            label.text = LocalizedTitle.lollipop.localized.uppercased()
            label.textAlignment = .left
            return label
        }()
        
        lazy var lollipopStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [lollipopImage, lollipopLabel])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        self.view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.view.addSubview(lollipopStack)
        lollipopStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
    }
}
