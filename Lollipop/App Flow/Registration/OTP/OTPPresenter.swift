//
//  OTPPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import SwiftyAttributes
import Alamofire

class OTPPresenter: NSObject, OTPPresenterProtocol  {
    
    var interactor : OTPInputInteractorProtocol?
    weak var view: OTPViewProtocol?
    var wireframe: OTPWireframeProtocol?
    
    var id = Int()
    var otpType: OTPType?
    var delegate: OTPControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed(firstChar: String, secondChar: String, thirdChar: String, fourthChar: String){
        guard !firstChar.isEmpty, !secondChar.isEmpty, !thirdChar.isEmpty, !fourthChar.isEmpty else {
            view?.validate(firstFieldEmpty: firstChar.isEmpty, secondFieldEmpty: secondChar.isEmpty, thirdFieldEmpty: thirdChar.isEmpty, fourthFieldEmpty: fourthChar.isEmpty)
            return
        }
    }
}

extension OTPPresenter: OTPOutputInteractorProtocol {
    func takeData(id: Int, email: String, otpType: OTPType?, delegate: OTPControllerProtocol?){
        self.id = id
        self.otpType = otpType
        self.delegate = delegate
        self.view?.setSubtitleWith(subtitle: self.setupSubtitleWith(email: email))
    }
    
    func parseVerificationData(result: Result<OTPModel, AFError>){
        switch result {
        case .success(let model):
            if self.otpType == .registration {
                UserDefaults.standard.set(Manager.token, forKey: StorageKeys.accessToken.rawValue)
                UserDefaults.standard.synchronize()
                Manager.isRegistered = true
                wireframe?.toMain()
            }else{
                UIApplication.topViewController()?.dismiss(animated: true, completion: {
                    self.delegate?.dismissAndPop()
                })
            }
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: OTPField Delegate
extension OTPPresenter {
    func becomeFirstResponder(tag: Int) {
        switch tag {
        case 1:
            view?.activateSecondField()
        case 2:
            view?.activateThirdField()
        case 3:
            view?.activateFourthField()
        case 4:
            view?.resignFirstResponder()
        default:
            print()
        }
    }
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
