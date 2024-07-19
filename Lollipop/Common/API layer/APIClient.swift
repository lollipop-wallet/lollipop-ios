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
                    if let vc = UIApplication.topViewController() {
                        vc.view.hideSpinner()
                    }else{
                        UIApplication.root().view.hideSpinner()
                    }
//                    let decoder = JSONDecoder()
//                    if let exception = try? decoder.decode(ExceptionModel.self, from: response.data ?? Data()) {
//                        Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: exception.message ?? "", shouldDismiss: false)
//                    }
                    do {
                        let errorDict = try JSONSerialization.jsonObject(with: response.data ?? Data()) as? [AnyHashable: Any] ?? [:]
                        let errors = errorDict["errors"] as? [String : [String]]
                                
                        var concatenatedMessage = ""
                        
                        for (key, messages) in (errors ?? [:]) {
                            for message in messages {
                                concatenatedMessage += message + "\n\n"
                            }
                        }
                        // Trim the trailing whitespace
                        concatenatedMessage = concatenatedMessage.trimmingCharacters(in: .whitespacesAndNewlines)
                        Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: concatenatedMessage, shouldDismiss: false)
                    } catch {
                        print("JsonError: ", error)
                        Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: LocalizedTitle.unknownError.localized + "\n" + error.localizedDescription, shouldDismiss: false)
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
    
    @discardableResult
    private static func performUpload<T:Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.upload(multipartFormData: { (multipartFormData) in
            let parameters = route.multipartFormData()
            print("Parametri su:", parameters ?? [:])

            for (key, value) in (parameters ?? [:]) {
                if let image = value as? Data {
                    multipartFormData.append(image, withName: key, fileName: "image_\(Date().millisecondsSince1970).jpeg", mimeType: "file")
                }
                if let text = value as? String {
                    multipartFormData.append(text.data(using: .utf8) ?? Data(), withName: key)
                }
            }
        }, with: route)
            .responseDecodable (decoder: decoder) { (response: DataResponse<T, AFError>) in
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
                    if let vc = UIApplication.topViewController() {
                        vc.view.hideSpinner()
                    }else{
                        UIApplication.root().view.hideSpinner()
                    }
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
                    if let vc = UIApplication.topViewController() {
                        vc.view.hideSpinner()
                    }else{
                        UIApplication.root().view.hideSpinner()
                    }
                    Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.unknownError.localized, shouldDismiss: false)
                }
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
    
    static func sendregistrationotp(completion:@escaping (Result<OTPModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.registrationotp, completion: completion)
    }
    
    static func verifyemail(id: Int, code: String, completion:@escaping (Result<Empty, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.verifyemail(id: id, code: code), completion: completion)
    }
    
    static func verifyresetpassword(code: String, email: String, password: String, confirmPassword: String, completion:@escaping (Result<NewPasswordModel, AFError>)->Void){
        Manager.authTypeHeader = ""
        performRequest(route: APIRouter.verifyresetpassword(code: code, email: email, password: password, confirmPassword: confirmPassword), completion: completion)
    }
    
    static func sendforgotpwdotp(email: String, completion:@escaping (Result<OTPModel, AFError>)->Void){
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
    
    static func getfavoriteshops(completion:@escaping (Result<[Brand], AFError>)->Void){
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
    
    static func getcardtemplates(completion:@escaping (Result<[Card], AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getcardtemplates, completion: completion)
    }
    
    static func getusercards(completion:@escaping (Result<[Card], AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getusercards, completion: completion)
    }
    
    static func togglecardfavorite(alias: String, completion:@escaping (Result<FavoriteCardsModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.togglecardfavorite(alias: alias), completion: completion)
    }
    
    static func reordercards(cards: String, completion:@escaping (Result<ReorderCardsModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.reordercards(cards: cards), completion: completion)
    }
    
    static func updateloyaltycard(cardAlias: String, cardName: String, cardNumber: String, cardBarCode: String, codeType: String, nameOnTheCard: String, notes: String, completion:@escaping (Result<EditCardModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.updateloyaltycard(cardAlias: cardAlias, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarCode, codeType: codeType, nameOnTheCard: nameOnTheCard, notes: notes), completion: completion)
    }
    
    static func getprofile(completion:@escaping (Result<ProfileModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getprofile, completion: completion)
    }
    
    static func updateavatar(avatar: Data, completion:@escaping (Result<UpdateAvatarModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performUpload(route: APIRouter.updateavatar(avatar: avatar), completion: completion)
    }
    
    static func createloyaltycard(cardName: String, cardNumber: String, cardBarCode: String, nameOnTheCard: String, codeType: String, note: String, partnerAlias: String, templateId: String, cardType: String, completion:@escaping (Result<NewLoyaltyCardModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.createloyaltycard(cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarCode, nameOnTheCard: nameOnTheCard, codeType: codeType, note: note, partnerAlias: partnerAlias, templateId: templateId, cardType: cardType), completion: completion)
    }
    
    static func createdisplaycard(frontImage: Data, backImage: Data, cardName: String, cardNumber: String, cardBarCode: String, nameOnTheCard: String, codeType: String, note: String, completion:@escaping (Result<NewLoyaltyCardModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performUpload(route: APIRouter.createdisplaycard(frontImage: frontImage, backImage: backImage, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarCode, nameOnTheCard: nameOnTheCard, codeType: codeType, note: note), completion: completion)
    }
    
    static func getcarddetails(alias: String, completion:@escaping (Result<Card, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getcarddetails(alias: alias), completion: completion)
    }
    
    static func getlocations(parnerId: Int, brands: String, cities: String, completion:@escaping (Result<LocationsModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getlocations(partnerId: parnerId, brands: brands, cities: cities), completion: completion)
    }
    
    static func getbranddetails(alias: String, completion:@escaping (Result<PartnerDetailsModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.getbranddetails(alias: alias), completion: completion)
    }
    
    static func inquiry(name: String, city: String, phone: String, partnerAlias: String, email: String, completion:@escaping (Result<PartnerCardSignupModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.inquiry(name: name, city: city, phone: phone, partnerAlias: partnerAlias, email: email), completion: completion)
    }
    
    static func updateuser(name: String, email: String, phone: String, dob: String, city: String, gender: String, completion:@escaping (Result<PersonalDataModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.updateuser(name: name, email: email, phone: phone, dob: dob, city: city, gender: gender), completion: completion)
    }
    
    static func deletecard(alias: String, completion:@escaping (Result<DeleteCardModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.deletecard(alias: alias), completion: completion)
    }
    
    static func logout(completion:@escaping (Result<Empty, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.logout, completion: completion)
    }
    
    static func deleteaccount(completion:@escaping (Result<Empty, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.deleteaccount, completion: completion)
    }
    
    static func updatelanguage(languageId: Int, completion:@escaping (Result<LanguageModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.updatelanguage(languageId: languageId), completion: completion)
    }
    
    static func changepassword(oldPassword: String, newPassword: String, newPasswordConfirmation: String, completion:@escaping (Result<ChangePasswordModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performRequest(route: APIRouter.changepassword(currentPwd: oldPassword, newPwd: newPassword, newPwdConfirm: newPasswordConfirmation), completion: completion)
    }
    
    static func updatedisplaycard(cardAlias: String, frontImage: Data, backImage: Data, cardName: String, cardNumber: String, cardBarCode: String, codeType: String, nameOnTheCard: String, notes: String, completion:@escaping (Result<EditCardModel, AFError>)->Void){
        Manager.authTypeHeader = APIAuthTypeHeader.bearer.authIdentifier
        performUpload(route: APIRouter.updatedisplaycard(cardAlias: cardAlias, frontImage: frontImage, backImage: backImage, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarCode, codeType: codeType, nameOnTheCard: nameOnTheCard, notes: notes), completion: completion)
    }
}

