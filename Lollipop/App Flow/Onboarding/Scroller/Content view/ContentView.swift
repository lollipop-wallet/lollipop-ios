//
//  ContentView.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22/04/2024.
//

import UIKit

class ContentView: UIViewController {
    
    var artworkImageView = UIImageView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var proceedView = UIView()
    var proceedLabel = UILabel()
    
    var pageIndex:Int!
    var titleString: String!
    var subtitleString: String!
    var artworkName: String!
    
    var delegate: ContentViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupFields()
    }
    
    override func viewDidLayoutSubviews() {

    }
    
    func setupFields() {
        self.artworkImageView.image = UIImage(named: artworkName)
        self.titleLabel.text = titleString
        self.subtitleLabel.text = subtitleString
        self.proceedLabel.text = pageIndex != 3 ? LocalizedTitle.cont.localized : LocalizedTitle.moveForward.localized
        self.proceedLabel.textColor = pageIndex != 3 ? AppColors.black : AppColors.white
        self.proceedView.layer.borderColor = AppColors.brandPrimary.cgColor
        self.proceedView.layer.borderWidth = 1
        self.proceedView.layer.cornerRadius = 12
        self.proceedView.layer.masksToBounds = true
        self.proceedView.backgroundColor = pageIndex != 3 ? AppColors.white : AppColors.brandPrimary
    }
    
    //MARK: Actions
    
    @objc func onProceedTap() {
        if self.pageIndex != 3 {
            delegate?.nextPage()
        }else{
            delegate?.proceed()
        }
    }
}
