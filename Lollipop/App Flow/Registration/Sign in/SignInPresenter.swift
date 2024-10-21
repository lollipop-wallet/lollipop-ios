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
import FBSDKCoreKit
import FBSDKLoginKit

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
    
    func signInFacebook(vc: SignInView){
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: vc) { (result, error) in
            if let error = error {
                // Handle login error here
                print("Error: \(error.localizedDescription)")
            } else if let result = result, !result.isCancelled {
                // Login successful, you can access the user's Facebook data here
                if let token = result.authenticationToken?.tokenString {
                    self.interactor?.facebookSignIn(token: token)
                }
            } else {
                // Login was canceled by the user
                print("Login was cancelled.")
            }
        }
    }
    
    func fetchFacebookUserData() {
        if AccessToken.current != nil {
            // You can make a Graph API request here to fetch user data
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
                if let error = error {
                    // Handle API request error here
                    print("Error: \(error.localizedDescription)")
                } else if let userData = result as? [String: Any] {
                    // Access the user data here
                    let userID = userData["id"] as? String
                    let name = userData["name"] as? String

                    // Handle the user data as needed
                    print("User ID: \(userID ?? "")")
                    print("Name: \(name ?? "")")
                    
                }
            }
        } else {
            print("No active Facebook access token.")
        }
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
