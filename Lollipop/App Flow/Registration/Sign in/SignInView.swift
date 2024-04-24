
//
//  SignInView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class SignInView: UIViewController, SignInViewProtocol {
    
    var termsLabel = UILabel()

    var presenter: SignInPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    //MARK: Actions
    
    @objc func onEmailTap() {
        
    }
    
    @objc func onAppleTap() {
        
    }
    
    @objc func onFacebookTap() {
        
    }
    
    @objc func onGoogleTap() {
        
    }
    
    @objc func onCloseTap() {
        dismiss(animated: true)
    }
}
