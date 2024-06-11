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
    var email = String()
    var otp = String()
    var secondsRemaining = 20

    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed(firstChar: String, secondChar: String, thirdChar: String, fourthChar: String){
        guard !firstChar.isEmpty, !secondChar.isEmpty, !thirdChar.isEmpty, !fourthChar.isEmpty else {
            view?.validate(firstFieldEmpty: firstChar.isEmpty, secondFieldEmpty: secondChar.isEmpty, thirdFieldEmpty: thirdChar.isEmpty, fourthFieldEmpty: fourthChar.isEmpty)
            return
        }
        let code = "\(firstChar)\(secondChar)\(thirdChar)\(fourthChar)"
        self.otp = code
        if self.otpType == .registration {
            interactor?.verify(id: self.id, code: code)
        }else{
            wireframe?.toNewPasswordWith(email: self.email, otp: self.otp)
        }
    }
    
    func requestNewCode(){
        self.view?.setSendNewCodeButtonHidden(isHidden: true)
        self.view?.setTimerLabelHidden(isHidden: false)
        self.initiateCountdownTimer()
    }
}

extension OTPPresenter: OTPOutputInteractorProtocol {
    func takeData(id: Int, email: String, otpType: OTPType?, delegate: OTPControllerProtocol?){
        self.id = id
        self.otpType = otpType
        self.email = email
        self.delegate = delegate
        self.view?.setSubtitleWith(subtitle: self.setupSubtitleWith(email: email))
        self.view?.setBackButtonToLeftBarButtonItems(shouldSet: otpType == .resetpwd)
    }
    
    func parseVerificationData(result: Result<Empty, AFError>){
        switch result {
        case .success(_):
            UserDefaults.standard.set(Manager.token, forKey: StorageKeys.accessToken.rawValue)
            UserDefaults.standard.synchronize()
            Manager.isRegistered = true
            wireframe?.toMain()
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
    
    fileprivate func setupTimerLabelWith(secondsRemaining: String) -> NSAttributedString {
        let part1 = "\(LocalizedTitle.askForNewCodeIn.localized): ".withAttributes([
            .textColor(AppColors.darkGrey),
            .font(.inter(ofSize: 16, name: .regular))
        ])
        
        let part2 = "00:\(secondsRemaining)".withAttributes([
            .textColor(AppColors.darkGrey),
            .font(.inter(ofSize: 16, name: .bold)),
        ])
        
        return part1 + part2
    }
}

//MARK: Timer
extension OTPPresenter {
    fileprivate func initiateCountdownTimer(){
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
                guard let self = self else {return}
                if self.secondsRemaining > 0 {
                    print ("\(self.secondsRemaining) seconds")
                    self.view?.setTimerLabelTextWith(text: self.setupTimerLabelWith(secondsRemaining: "\(self.secondsRemaining)"))
                    self.secondsRemaining -= 1
                } else {
                    timer.invalidate()
                    self.secondsRemaining = 20
                    self.view?.setSendNewCodeButtonHidden(isHidden: false)
                    self.view?.setTimerLabelHidden(isHidden: true)
                }
            }
        }
    }
}
