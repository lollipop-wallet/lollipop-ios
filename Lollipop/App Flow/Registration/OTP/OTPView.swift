
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
    
    //MARK: OTPView protocol
    
    func setSubtitleWith(subtitle: NSAttributedString){
        DispatchQueue.main.async {
            self.subtitleLabel.attributedText = subtitle
        }
    }

    //MARK: Actions
    @objc func onCloseTap() {
        dismiss(animated: true)
    }
    
    @objc func onProceedTap() {
        
    }
}
