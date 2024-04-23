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
        
        self.view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
