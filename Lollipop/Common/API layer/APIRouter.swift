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
    case register(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String)

    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getconfig:
            return .get
        case .login, .register:
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
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getconfig:
            return nil
        case .login(let email, let password):
            return [APIParameterKey.email : email, APIParameterKey.password : password]
        case .register(let firstname, let lastname, let email, let dob, let gender, let city)
            return []
        }
    }
        
        // MARK: - URLRequestConvertible
        func asURLRequest() throws -> URLRequest {
            let finalUrl = try ("\(Configuration.productionServerBaseURL)" + path).asURL()
            var urlRequest = URLRequest(url: finalUrl)
            urlRequest.httpMethod = method.rawValue
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
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
