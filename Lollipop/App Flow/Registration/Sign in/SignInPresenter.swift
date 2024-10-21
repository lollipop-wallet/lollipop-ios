//
//  SignInPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import GoogleSignIn
import Alamofire

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
            self.interactor?.googleSignIn(token: signInResult?.user.idToken?.tokenString ?? "")
          // If sign in succeeded, display the app's main content View.
        }
    }
    
    func signInApple(){
        
    }
    
    func signInFacebook(){
        
    }
}

extension SignInPresenter: SignInOutputInteractorProtocol {
    func takeData(result: Result<LoginModel, AFError>){
        switch result {
        case .success(let model):
            Manager.token = model.token ?? ""
            UserDefaults.standard.set(Manager.token, forKey: StorageKeys.accessToken.rawValue)
            UserDefaults.standard.synchronize()
            Manager.isRegistered = true
            wireframe?.toMain()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
