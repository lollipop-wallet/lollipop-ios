//
//  SignInUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 23.4.24..
//

import UIKit
import SwiftyAttributes

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
        
        self.termsLabel.textAlignment = .center
        self.termsLabel.numberOfLines = 0
        self.termsLabel.lineBreakMode = .byWordWrapping
        self.termsLabel.attributedText = setupTermsString()
        
        //MARK: Email section
        
        lazy var emailImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.envelopeIcon)
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var emailLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .medium)
            label.text = LocalizedTitle.continueWirhEmail.localized
            label.textAlignment = .center
            return label
        }()
        
        lazy var emailStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [emailImage, emailLabel])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 8
            return stack
        }()
        
        lazy var emailButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onEmailTap), for: .touchUpInside)
            return button
        }()
        
        lazy var emailPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(emailStack)
            emailStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.backgroundColor = AppColors.brandPrimary
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            return view
        }()
        
        //MARK: Separator section

        lazy var leftLineView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.darkGrey
            view.snp.makeConstraints { make in
                make.height.equalTo(1)
                make.width.equalTo((self.view.frame.width / 2) - 37)
            }
            return view
        }()
        
        lazy var rightLineView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.darkGrey
            view.snp.makeConstraints { make in
                make.height.equalTo(1)
                make.width.equalTo((self.view.frame.width / 2) - 37)
            }
            return view
        }()
        
        lazy var orLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .light)
            label.text = LocalizedTitle.or.localized
            label.textColor = AppColors.lightGrey
            label.textAlignment = .center
            label.snp.makeConstraints { make in
                make.width.equalTo(10)
            }
            return label
        }()
        
        lazy var separatorStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [leftLineView, orLabel, rightLineView])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 8
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
        
        self.view.addSubview(self.termsLabel)
        self.termsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-48)
        }
        
        self.view.addSubview(emailPlaceholderView)
        emailPlaceholderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(self.termsLabel.snp.top).offset(-16)
            make.height.equalTo(48)
        }
        
        self.view.addSubview(separatorStack)
        separatorStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(emailPlaceholderView.snp.top).offset(-16)
        }
    }
    
    fileprivate func setupTermsString() -> NSAttributedString{
        let part1 = LocalizedTitle.termsPart1.localized.withAttributes([
            .textColor(AppColors.white),
            .font(.inter(ofSize: 14, name: .light))
        ])
        
        let part2 = LocalizedTitle.terms.localized.withAttributes([
            .textColor(AppColors.white),
            .font(.inter(ofSize: 14, name: .bold)),
            .underlineStyle(.single)
        ])
        
        let part3 = " \(LocalizedTitle.and.localized) ".withAttributes([
            .textColor(AppColors.white),
            .font(.inter(ofSize: 14, name: .light))
        ])
        
        let part4 = LocalizedTitle.privacy.localized.withAttributes([
            .textColor(AppColors.white),
            .font(.inter(ofSize: 14, name: .bold)),
            .underlineStyle(.single)
        ])
        
        let part5 = LocalizedTitle.termsPart2.localized.withAttributes([
            .textColor(AppColors.white),
            .font(.inter(ofSize: 14, name: .light))
        ])
        
        return part1 + part2 + part3 + part4 + part5
        
    }
}
