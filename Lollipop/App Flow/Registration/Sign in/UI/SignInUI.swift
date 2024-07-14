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
            label.font = .inter(ofSize: 16, name: .semibold)
            label.text = LocalizedTitle.lollipop.localized.uppercased()
            label.textAlignment = .center
            label.textColor = AppColors.white
            return label
        }()
        
        lazy var lollypopPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(lollipopLabel)
            lollipopLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.top.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-16)
                make.bottom.equalToSuperview().offset(-8)
            }
            view.backgroundColor = AppColors.brandSecondary.withAlphaComponent(0.5)
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var lollipopStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [lollipopLabel])
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
            label.textColor = AppColors.white
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
            view.addSubview(emailButton)
            emailButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
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
        
        //MARK: Apple section
        
        lazy var appleImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.appleSignInIcon)
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(47)
            }
            return imageView
        }()
        
        lazy var appleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .medium)
            label.text = LocalizedTitle.continueWithApple.localized
            label.textAlignment = .center
            label.textColor = AppColors.white
            return label
        }()
        
        lazy var appleStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [appleImage, appleLabel])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 4
            return stack
        }()
        
        lazy var appleButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAppleTap), for: .touchUpInside)
            return button
        }()
        
        lazy var applePlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(appleStack)
            appleStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(appleButton)
            appleButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.black
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            view.snp.makeConstraints { make in
                make.height.equalTo(55)
            }
            return view
        }()
        
        //MARK: Facebook section
        
        lazy var facebookImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.facebookSignInIcon)
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(47)
            }
            return imageView
        }()
        
        lazy var facebookLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .medium)
            label.text = LocalizedTitle.continueWithFacebook.localized
            label.textAlignment = .center
            label.textColor = AppColors.white
            return label
        }()
        
        lazy var facebookStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [facebookImage, facebookLabel])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 4
            return stack
        }()
        
        lazy var facebookButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onFacebookTap), for: .touchUpInside)
            return button
        }()
        
        lazy var facebookPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(facebookStack)
            facebookStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(facebookButton)
            facebookButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.fb
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            view.snp.makeConstraints { make in
                make.height.equalTo(55)
            }
            return view
        }()
        
        //MARK: Google section
        
        lazy var googleImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.googleSignInIcon)
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(47)
            }
            return imageView
        }()
        
        lazy var googleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .medium)
            label.text = LocalizedTitle.continueWithGoogle.localized
            label.textColor = AppColors.black
            label.textAlignment = .center
            return label
        }()
        
        lazy var googleStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [googleImage, googleLabel])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 4
            return stack
        }()
        
        lazy var googleButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onGoogleTap), for: .touchUpInside)
            return button
        }()
        
        lazy var googlePlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(googleStack)
            googleStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(googleButton)
            googleButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.lightGrey
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            view.snp.makeConstraints { make in
                make.height.equalTo(55)
            }
            return view
        }()
        
        lazy var socialStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [googlePlaceholderView, facebookPlaceholderView, applePlaceholderView])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()

        lazy var closeButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onCloseTap), for: .touchUpInside)
            button.setImage(UIImage(named: AssetTitles.closeSignInIcon), for: .normal)
            return button
        }()

        
        self.view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
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
        
        self.view.addSubview(socialStack)
        socialStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(separatorStack.snp.top).offset(-16)
        }
        
//        self.view.addSubview(closeButton)
//        closeButton.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(24)
//            make.top.equalToSuperview().offset(60)
//            make.width.height.equalTo(48)
//        }
        
        self.view.addSubview(lollypopPlaceholder)
        lollypopPlaceholder.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(115)
            make.height.equalTo(36)
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
