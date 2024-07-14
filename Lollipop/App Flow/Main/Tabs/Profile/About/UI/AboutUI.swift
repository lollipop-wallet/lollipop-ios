//
//  AboutUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 28/04/2024.
//

import UIKit

extension AboutView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        AboutWireframe.createModule(AboutRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        appearance.backgroundColor = AppColors.lightGrey
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        
        self.navigationItem.title = LocalizedTitle.aboutApp.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        lazy var topLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutTopText.localized
            return label
        }()
        
        lazy var imageOne: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.aboutIcon1)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        lazy var firstTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 18, name: .semibold)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutTitle1.localized
            return label
        }()
        
        lazy var firstSubtitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutSubtitle1.localized
            return label
        }()
        
        lazy var imageTwo: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.aboutIcon2)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        lazy var secondTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 18, name: .semibold)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutTitle2.localized
            return label
        }()
        
        lazy var secondSubtitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutSubtitle2.localized
            return label
        }()
        
        lazy var thirdTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 18, name: .semibold)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutTitle3.localized
            return label
        }()
        
        lazy var thirdSubtitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.aboutSubtitle3.localized
            return label
        }()
        
        lazy var imageThree: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.aboutIcon3)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(imageOne)
        imageOne.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo((self.view.frame.width - 40) * 0.71)
        }
        
        contentView.addSubview(firstTitleLabel)
        firstTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageOne.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(firstSubtitleLabel)
        firstSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(imageTwo)
        imageTwo.snp.makeConstraints { make in
            make.top.equalTo(firstSubtitleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo((self.view.frame.width - 40) * 0.71)
        }
        
        contentView.addSubview(secondTitleLabel)
        secondTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageTwo.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(secondSubtitleLabel)
        secondSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(thirdTitleLabel)
        thirdTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(secondSubtitleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(thirdSubtitleLabel)
        thirdSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(imageThree)
        imageThree.snp.makeConstraints { make in
            make.top.equalTo(thirdSubtitleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo((self.view.frame.width - 40) * 0.71)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
