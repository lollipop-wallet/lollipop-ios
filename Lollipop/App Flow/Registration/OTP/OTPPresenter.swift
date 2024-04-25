//
//  OTPPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import SwiftyAttributes

class OTPPresenter: OTPPresenterProtocol  {
    
    var interactor : OTPInputInteractorProtocol?
    weak var view: OTPViewProtocol?
    var wireframe: OTPWireframeProtocol?
    
    func viewDidLoad() {
        self.view?.setSubtitleWith(subtitle: self.setupSubtitleWith(email: "test@gmail.com"))
    }
}

extension OTPPresenter: OTPOutputInteractorProtocol {
    
}

//MARK: Private methods
extension OTPPresenter {
    fileprivate func setupSubtitleWith(email: String) -> NSAttributedString {
        let part1 = LocalizedTitle.activationCode.localized.withAttributes([
            .textColor(AppColors.darkestGrey),
            .font(.inter(ofSize: 14, name: .bold))
        ])
        
        let part2 = LocalizedTitle.activationCodeText1.localized.withAttributes([
            .textColor(AppColors.darkestGrey),
            .font(.inter(ofSize: 14, name: .regular)),
        ])
        
        let part3 = "\(email).".withAttributes([
            .textColor(AppColors.darkestGrey),
            .font(.inter(ofSize: 14, name: .bold))
        ])
        
        let part4 = LocalizedTitle.activationCodeText2.localized.withAttributes([
            .textColor(AppColors.darkestGrey),
            .font(.inter(ofSize: 14, name: .regular)),
        ])
        
        return part1 + part2 + part3 + part4
    }
}
