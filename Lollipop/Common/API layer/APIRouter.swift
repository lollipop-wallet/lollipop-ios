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
    case verifyresetpassword(code: String, email: String, password: String, confirmPassword: String)


    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getconfig, .verifyemail:
            return .get
        case .login, .register, .registrationotp, .verifyresetpassword:
            return .post
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
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getconfig, .registrationotp, .verifyemail:
            return nil
        case .login(let email, let password):
            return [APIParameterKey.email : email, APIParameterKey.password : password]
        case .register(let name, let email, let dob, let gender, let city, let password, let confirmPassword):
            return [APIParameterKey.name : name, APIParameterKey.email : email, APIParameterKey.dob : dob, APIParameterKey.gender : gender, APIParameterKey.city : city, APIParameterKey.password : password, APIParameterKey.passwordConfirmation :  confirmPassword]
        case .verifyresetpassword(let code, let email, let password, let confirmPassword):
            return [APIParameterKey.otp : code, APIParameterKey.email :  email, APIParameterKey.password : password, APIParameterKey.passwordConfirmation : confirmPassword]
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
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
            return urlRequest
        }
    }
