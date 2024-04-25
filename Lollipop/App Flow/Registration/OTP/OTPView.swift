
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

    //MARK: Actions
    @objc func onCloseTap() {
        dismiss(animated: true)
    }
    
    @objc func onProceedTap() {
        
    }
}
