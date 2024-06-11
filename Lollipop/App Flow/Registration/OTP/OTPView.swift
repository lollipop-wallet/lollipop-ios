
//
//  OTPView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class OTPView: UIViewController, OTPViewProtocol {
    
    var subtitleLabel = UILabel()
    
    var firstOTPField = OTPInputField()
    var secondOTPField = OTPInputField()
    var thirdOTPField = OTPInputField()
    var fourthOTPField = OTPInputField()
    var backButton = UIBarButtonItem()
    var requestNewCodeButton = UIButton()
    var requestNewCodeTimerLabel = UILabel()

    var presenter: OTPPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.firstOTPField.textField.becomeFirstResponder()
    }
    
    //MARK: OTPView protocol
    
    func setSubtitleWith(subtitle: NSAttributedString){
        DispatchQueue.main.async {
            self.subtitleLabel.attributedText = subtitle
        }
    }
    func activateFirstField(){
        DispatchQueue.main.async {
            self.firstOTPField.textField.becomeFirstResponder()
        }
    }
    
    func activateSecondField(){
        DispatchQueue.main.async {
            self.secondOTPField.textField.becomeFirstResponder()
        }
    }
    
    func activateThirdField(){
        DispatchQueue.main.async {
            self.thirdOTPField.textField.becomeFirstResponder()
        }
    }
    
    func activateFourthField(){
        DispatchQueue.main.async {
            self.fourthOTPField.textField.becomeFirstResponder()
        }
    }
    
    func resignFirstResponder(){
        DispatchQueue.main.async {
            self.fourthOTPField.textField.resignFirstResponder()
        }
    }
    
    func validate(firstFieldEmpty: Bool, secondFieldEmpty: Bool, thirdFieldEmpty: Bool, fourthFieldEmpty: Bool){
        self.firstOTPField.borderWidth = 1
        self.firstOTPField.borderColor = firstFieldEmpty ? AppColors.error : AppColors.black
        
        self.secondOTPField.borderWidth = 1
        self.secondOTPField.borderColor = secondFieldEmpty ? AppColors.error : AppColors.black
        
        self.thirdOTPField.borderWidth = 1
        self.thirdOTPField.borderColor = thirdFieldEmpty ? AppColors.error : AppColors.black
        
        self.fourthOTPField.borderWidth = 1
        self.fourthOTPField.borderColor = fourthFieldEmpty ? AppColors.error : AppColors.black
    }
    
    func setBackButtonToLeftBarButtonItems(shouldSet: Bool){
        DispatchQueue.main.async {
            self.navigationItem.leftBarButtonItems = shouldSet ? [self.backButton] : []
        }
    }
    
    func setTimerLabelHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.requestNewCodeTimerLabel.isHidden = isHidden
        }
    }
    
    func setSendNewCodeButtonHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.requestNewCodeButton.isHidden = isHidden
        }
    }
    
    func setTimerLabelTextWith(text: NSAttributedString){
        DispatchQueue.main.async {
            self.requestNewCodeTimerLabel.attributedText = text
        }
    }


    //MARK: Actions
    @objc func onCloseTap() {
        dismiss(animated: true)
    }
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onProceedTap() {
        presenter?.proceed(firstChar: firstOTPField.textField.text ?? "", secondChar: secondOTPField.textField.text ?? "", thirdChar: thirdOTPField.textField.text ?? "", fourthChar: fourthOTPField.textField.text ?? "")
    }
    
    @objc func onRequestNewCodeTap() {
        presenter?.requestNewCode()
    }
}
