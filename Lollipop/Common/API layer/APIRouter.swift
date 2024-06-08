//
//  APIRouter.swift
//  VideoAI
//
//  Created by Aleksandar Draskovic on 24/02/2024.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible, Equatable {

    case getconfig
    case login(email: String, password: String)
    case register(name: String, email: String, dob: String, gender: String, city: String, password: String, confirmPassword: String)
    case registrationotp
    case verifyemail(id: Int, code: String)
    case sendforgotpwdotp(email: String)
    case verifyresetpassword(code: String, email: String, password: String, confirmPassword: String)
    case gethome
    case getbrands
    case getfavoritebrands
    case getpromotions
    case getfavoriteshops
    case togglefavorite(alias: String)
    case suggestshop(name: String, country: String, city: String, address: String, description: String)
    case getcardtemplates
    case getusercards
    case togglecardfavorite(alias: String)
    case reordercards(cards: String)
    case updateloyaltycard(cardAlias: String, cardName: String, cardNumber: String, cardBarCode: String, codeType: String, nameOnTheCard: String, notes: String)
    case getprofile
    case updateavatar(avatar: Data)
    case createloyaltycard(cardName: String, cardNumber: String, cardBarCode: String, nameOnTheCard: String, codeType: String, note: String, partnerAlias: String, templateId: String)
    case createdisplaycard(frontImage: Data, backImage: Data, cardName: String, cardNumber: String, cardBarCode: String, nameOnTheCard: String, codeType: String, note: String)
    case getcarddetails(alias: String)
    case getlocations(partnerId: Int, brands: String, cities: String)
    case getbranddetails(alias: String)
    case inquiry(name: String, city: String, phone: String, partnerAlias: String, email: String)
    case updateuser(name: String, email: String, phone: String, dob: String, city: String, gender: String)
    case deletecard(alias: String)
    case logout
    case deleteaccount
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getconfig, .verifyemail, .gethome, .getbrands, .getfavoritebrands, .getpromotions, .getfavoriteshops, .getcardtemplates, .getusercards, .getprofile, .getcarddetails, .getlocations, .getbranddetails:
            return .get
        case .login, .register, .registrationotp, .verifyresetpassword, .sendforgotpwdotp, .togglefavorite, .suggestshop, .togglecardfavorite, .reordercards, .updateloyaltycard, .updateavatar, .createloyaltycard, .createdisplaycard, .inquiry, .updateuser, .logout:
            return .post
        case .deletecard, .deleteaccount:
            return .delete
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getconfig:
            return "details"
        case .login:
            return "login"
        case .register:
            return "register"
        case .registrationotp:
            return "email/verification-notification"
        case .verifyemail(let id, let code):
            return "verify-email/\(id)/\(code)"
        case .verifyresetpassword:
            return "reset-password-otp"
        case .sendforgotpwdotp:
            return "forgot-password-otp"
        case .gethome:
            return "homepage"
        case .getbrands:
            return "brands"
        case .getfavoritebrands:
            return "brands/user-favorites"
        case .getpromotions:
            return "banners?includes=brand"
        case .getfavoriteshops:
            return "brands/favorites"
        case .togglefavorite:
            return "brands/user-favorites"
        case .suggestshop:
            return "suggestions"
        case .getcardtemplates:
            return "card-templates?includes=partner"
        case .getusercards:
            return "cards?includes=partner"
        case .togglecardfavorite:
            return "cards/favorites"
        case .reordercards:
            return "cards/positions"
        case .updateloyaltycard(let alias,_,_,_,_,_,_):
            return "cards/\(alias)?includes=partner"
        case .getprofile:
            return "user"
        case .updateavatar:
            return "user/avatar"
        case .createloyaltycard, .createdisplaycard:
            return "cards"
        case .getcarddetails(let alias):
            return "cards/\(alias)?includes=partner.brands,partner.rule,partner.instruction"
        case .getlocations(let partnerId, let brands, let cities):
            return "locations?partner_id=\(partnerId)&brands=\(brands)&cities=\(cities)"
        case .getbranddetails(let alias):
            return "brands/\(alias)?includes=partner.brands,partner.rule,partner.instruction,partner.card_templates,banners.brand,locations,user_favorite"
        case .inquiry:
            return "inquiries"
        case .updateuser, .deleteaccount:
            return "user"
        case .deletecard(let alias):
            return "cards/\(alias)"
        case .logout:
            return "logout"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getconfig, .registrationotp, .verifyemail, .gethome, .getbrands, .getfavoritebrands, .getpromotions, .getfavoriteshops, .getcardtemplates, .getusercards, .getprofile, .updateavatar, .createdisplaycard, .getcarddetails, .getlocations, .getbranddetails, .deletecard, .logout, .deleteaccount:
            return nil
        case .login(let email, let password):
            return [APIParameterKey.email : email, APIParameterKey.password : password]
        case .register(let name, let email, let dob, let gender, let city, let password, let confirmPassword):
            return [APIParameterKey.name : name, APIParameterKey.email : email, APIParameterKey.dob : dob, APIParameterKey.gender : gender, APIParameterKey.city : city, APIParameterKey.password : password, APIParameterKey.passwordConfirmation :  confirmPassword]
        case .verifyresetpassword(let code, let email, let password, let confirmPassword):
            return [APIParameterKey.otp : code, APIParameterKey.email :  email, APIParameterKey.password : password, APIParameterKey.passwordConfirmation : confirmPassword]
        case .sendforgotpwdotp(let email):
            return [APIParameterKey.email : email]
        case .togglefavorite(let alias):
            return [APIParameterKey.brandAlias : alias]
        case .suggestshop(let name, let country, let city, let address, let description):
            return [APIParameterKey.name : name, APIParameterKey.country : country, APIParameterKey.city : city, APIParameterKey.address : address, APIParameterKey.description : description]
        case .togglecardfavorite(let alias):
            return [APIParameterKey.cardAlias : alias]
        case .reordercards(let cards):
            return [APIParameterKey.cards : cards]
        case .updateloyaltycard(_, let cardName, let cardNumber, let cardBarCode, let codeType, let nameOnTheCard, let notes):
            return [APIParameterKey.name : cardName, APIParameterKey.cardNumber : cardNumber, APIParameterKey.code : cardBarCode, APIParameterKey.codeType : codeType, APIParameterKey.note : notes, APIParameterKey.nameOnTheCard : nameOnTheCard]
        case .createloyaltycard(let cardName, let cardNumber, let cardBarCode, let nameOnTheCard, let codeType, let note, let partnerAlias, let templateId):
            return [APIParameterKey.name : cardName, APIParameterKey.cardNumber : cardNumber, APIParameterKey.code : cardBarCode, APIParameterKey.codeType : codeType, APIParameterKey.note : note, APIParameterKey.partnerAlias : partnerAlias, APIParameterKey.cardTemplateId : templateId, APIParameterKey.type : CardType.loyalty.rawValue, APIParameterKey.nameOnTheCard : nameOnTheCard]
        case .inquiry(let name, let city, let phone, let alias, let email):
            return [APIParameterKey.type : InquiryType.card.rawValue, APIParameterKey.customerName : name, APIParameterKey.country : Configuration.defaultCountry, APIParameterKey.city : city, APIParameterKey.phone : phone, APIParameterKey.partnerAlias : alias, APIParameterKey.email : email]
        case .updateuser(let name, let email, let phone, let dob, let city, let gender):
            return [APIParameterKey.name : name, APIParameterKey.email : email, APIParameterKey.phone : phone, APIParameterKey.dob : dob, APIParameterKey.city : city, APIParameterKey.gender : gender, APIParameterKey.country : Configuration.defaultCountry]
            
        }
    }
        
        // MARK: - URLRequestConvertible
        func asURLRequest() throws -> URLRequest {
            let finalUrl = try ("\(Configuration.productionServerBaseURL)" + path).asURL()
            var urlRequest = URLRequest(url: finalUrl)
            urlRequest.httpMethod = method.rawValue
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            if Manager.authTypeHeader == APIAuthTypeHeader.bearer.authIdentifier {
                print("Heder je: ", "Bearer \(Manager.token)")
                urlRequest.setValue("Bearer \(Manager.token)", forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
            }
            // Parameters
            print("Parametri su:", parameters ?? [:])
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    print("ovo")
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
            return urlRequest
        }
    
        func multipartFormData() -> Parameters? {
            switch self {
            case .getconfig, .registrationotp, .verifyemail, .gethome, .getbrands, .getfavoritebrands, .getpromotions, .getfavoriteshops, .getcardtemplates, .getusercards, .getprofile, .login, .register, .verifyresetpassword, .sendforgotpwdotp, .togglefavorite, .suggestshop, .togglecardfavorite, .reordercards, .updateloyaltycard, .createloyaltycard, .getcarddetails, .getlocations, .getbranddetails, .inquiry, .updateuser, .deletecard, .logout, .deleteaccount:
                return nil
            case .updateavatar(let avatar):
                return [APIParameterKey.avatar : avatar]
            case .createdisplaycard(let frontImage, let backImage, let cardName, let cardNumber, let cardBarCode, let nameOnTheCard, let codeType, let note):
                return [APIParameterKey.frontImage : frontImage, APIParameterKey.backImage : backImage, APIParameterKey.name : cardName, APIParameterKey.cardNumber : cardNumber, APIParameterKey.code : cardBarCode, APIParameterKey.codeType : codeType, APIParameterKey.note : note, APIParameterKey.type : CardType.display.rawValue, APIParameterKey.nameOnTheCard : nameOnTheCard]
            }
        }
    }

