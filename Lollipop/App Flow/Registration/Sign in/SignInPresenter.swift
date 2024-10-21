//
//  SignInPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import GoogleSignIn

class SignInPresenter: SignInPresenterProtocol  {
    
    var interactor : SignInInputInteractorProtocol?
    weak var view: SignInViewProtocol?
    var wireframe: SignInWireframeProtocol?
 
    func signInEmail() {
        wireframe?.toManualSignIn()
    }
    
    func signInGoogle(vc: SignInView){
       vc.view.showSpinner()
        GIDSignIn.sharedInstance.signIn(withPresenting: vc) { signInResult, error in
          guard error == nil else { return }
            vc.view.hideSpinner()
            print("ovo je rezultat: ", signInResult)
            print("GoogleUserToken: ", signInResult?.user.idToken?.tokenString)
            print("GoogleIdToken", signInResult?.user.accessToken.tokenString)
          // If sign in succeeded, display the app's main content View.
        }
    }
    
    func signInApple(){
        
    }
    
    func signInFacebook(){
        
    }
}

extension SignInPresenter: SignInOutputInteractorProtocol {
    
}
