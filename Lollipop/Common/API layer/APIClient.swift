//
//  APIClient.swift
//  VideoAI
//
//  Created by Aleksandar Draskovic on 24/02/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    
    //MARK: Timeout setup
    
    var APISession: Session
    let configuration = URLSessionConfiguration.default
    
    private init() {
      configuration.timeoutIntervalForRequest = 30
      APISession = Session(configuration: configuration)
    }
    private static let sharedClient = APIClient()
  
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        if !Connectivity.isConnectedToInternet(){
            UIApplication.root().view.hideSpinner()
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.noInternet.localized, shouldDismiss: false)
            return sharedClient.APISession.request("")
        }
          return sharedClient.APISession.request(route)
              .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                  print("API response code: ",response.response?.statusCode ?? "")
                  print("API URL: ", response.request?.url?.absoluteString ?? "")
                  let json = JSON(response.data ?? Data())
                  print("API result: ", json)
                switch response.response?.statusCode ?? 0{
                case 200...300:
                    completion(response.result)
                case 401:
                    print("Unknown")
                case 422:
                    UIApplication.topViewController()?.view.hideSpinner()
                    let decoder = JSONDecoder()
                    if let exception = try? decoder.decode(ExceptionModel.self, from: response.data ?? Data()) {
                        Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: exception.message ?? "", shouldDismiss: false)
                    }
                case 403, 404, 500:
                    Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: LocalizedTitle.unknownError.localized, shouldDismiss: false)
                    if let vc = UIApplication.topViewController() {
                        vc.view.hideSpinner()
                    }else{
                        UIApplication.root().view.hideSpinner()
                    }
                default:
                    UIApplication.root().view.hideSpinner()
                }
              }.responseString { (response) in
            //print("Odgovor:",response.value)
          }
      }
        
   //MARK: API methods
     static func getconfig(completion:@escaping (Result<ConfigModel, AFError>)->Void){
         performRequest(route: APIRouter.getconfig, completion: completion)
     }
    
    static func login(email: String, password: String, completion:@escaping (Result<LoginModel, AFError>)->Void){
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    
    static func register(name: String, email: String, dob: String, gender: String, city: String, password: String, confirmPassword: String, completion:@escaping (Result<RegisterModel, AFError>)->Void){
        performRequest(route: APIRouter.register(name: name, email: email, dob: dob, gender: gender, city: city, password: password, confirmPassword: confirmPassword), completion: completion)
    }
    
    static func verifyemail(id: Int, code: String, completion:@escaping (Result<Empty, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.verifyemail(id: id, code: code), completion: completion)
    }
    
    static func verifyresetpassword(code: String, email: String, password: String, confirmPassword: String, completion:@escaping (Result<NewPasswordModel, AFError>)->Void){
        Manager.authTypeHeader = ""
        performRequest(route: APIRouter.verifyresetpassword(code: code, email: email, password: password, confirmPassword: confirmPassword), completion: completion)
    }
    
    static func sendforgotpwdotp(email: String, completion:@escaping (Result<ForgotPwdEmailModel, AFError>)->Void){
        Manager.authTypeHeader = ""
        performRequest(route: APIRouter.sendforgotpwdotp(email: email), completion: completion)
    }
    
    static func gethome(completion:@escaping (Result<HomeModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.gethome, completion: completion)
    }
    
    static func getbrands(completion:@escaping (Result<[Brand], AFError>)->Void){
        Manager.authTypeHeader = ""
        performRequest(route: APIRouter.getbrands, completion: completion)
    }
    
    static func getfavoritebrands(completion:@escaping (Result<[Brand], AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getfavoritebrands, completion: completion)
    }
    
    static func getpromotions(completion:@escaping (Result<[Banner], AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getpromotions, completion: completion)
    }
    
    static func getfavoriteshops(completion:@escaping (Result<MyShopsModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getfavoriteshops, completion: completion)
    }
    
    static func togglefavorite(alias: String, completion:@escaping (Result<SetToFavoriteModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.togglefavorite(alias: alias), completion: completion)
    }
    
    static func suggestshop(name: String, country: String, city: String, address: String, description: String, completion:@escaping (Result<NewPartnerModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.suggestshop(name: name, country: country, city: city, address: address, description: description), completion: completion)
    }
}

