//
//  CardDetailsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 1.5.24..
//

import UIKit

extension CardDetailsView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        CardDetailsWireframe.createModule(CardDetailsRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.cardDetails.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        self.cardImageView.contentMode = .scaleAspectFill
        self.cardImageView.layer.cornerRadius = 8
        self.cardImageView.layer.borderWidth = 1
        self.cardImageView.layer.borderColor = AppColors.brandPrimary.cgColor
        self.cardImageView.snp.makeConstraints { make in
            make.width.equalTo(198)
            make.height.equalTo(128)
        }
        self.cardImageView.backgroundColor = .red
        
        ///Card name
        lazy var staticCartNameLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = "\(LocalizedTitle.cardTitle.localized):"
            return label
        }()
        
        self.cardNameLabel.font = .inter(ofSize: 14, name: .regular)
        self.cardNameLabel.textColor = AppColors.black
        self.cardNameLabel.textAlignment = .left
        
        lazy var cardNameStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [staticCartNameLabel, self.cardNameLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 8
            stack.snp.makeConstraints { make in
                make.width.equalTo(self.view.frame.width - 40)
            }
            return stack
        }()
        
        ///Barcode
        
        lazy var staticBarcodeLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = "\(LocalizedTitle.barcode.localized):"
            return label
        }()
        
        self.cardBarcodeLabel.font = .inter(ofSize: 14, name: .regular)
        self.cardBarcodeLabel.textColor = AppColors.black
        self.cardBarcodeLabel.textAlignment = .left
        
        lazy var barcodeStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [staticBarcodeLabel, self.cardBarcodeLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 8
            stack.snp.makeConstraints { make in
                make.width.equalTo(self.view.frame.width - 40)
            }
            return stack
        }()
        
        ///Notes
        lazy var staticNotesLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = "\(LocalizedTitle.notes.localized):"
            return label
        }()
        
        self.cardNotesLabel.font = .inter(ofSize: 14, name: .regular)
        self.cardNotesLabel.textColor = AppColors.black
        self.cardNotesLabel.textAlignment = .left
        self.cardNotesLabel.numberOfLines = 0
        self.cardNotesLabel.lineBreakMode = .byWordWrapping
        self.cardNotesLabel.text = "Volutpat tempus mi sed vitae nunc amet diam integer. Interdum congue suspendisse in sit amet. Nisi vitae sed cras eget massa vel sagittis. Ultrices tristique eu varius mauris blandit aliquam. Vitae pharetra auctor sit eget quam sapien tempor."
        
        lazy var notesStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [staticNotesLabel, self.cardNotesLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 8
            stack.snp.makeConstraints { make in
                make.width.equalTo(self.view.frame.width - 40)
            }
            return stack
        }()
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.cardImageView, cardNameStack, barcodeStack, notesStack])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 24
            return stack
        }()
        
        
        lazy var dataPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(mainStack)
            mainStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalToSuperview().offset(-40)
                make.top.equalToSuperview().offset(24)
            }
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        
        lazy var topPaddingView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            return view
        }()
        
        lazy var bottomView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.shadowColor =  UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 0.1).cgColor
            view.layer.shadowOpacity = 1
            view.layer.shadowOffset = CGSize(width: 0, height: 8)
            view.layer.shadowRadius = 34
            return view
        }()
        
        lazy var shaddowPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(topPaddingView)
            topPaddingView.snp.makeConstraints { make in
                make.leading.trailing.top.equalToSuperview()
                make.height.equalTo(74)
            }
            view.addSubview(bottomView)
            bottomView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalTo(topPaddingView.snp.bottom)
            }
            
            view.addSubview(dataPlaceholderView)
            dataPlaceholderView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }

            return view
        }()
        
        
        lazy var editButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onEditTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.save.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 16, name: .medium)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()
        
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        backgroundView.addSubview(shaddowPlaceholderView)
        shaddowPlaceholderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        backgroundView.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-44)
            make.height.equalTo(48)
        }
    }
}

