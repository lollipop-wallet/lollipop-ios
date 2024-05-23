//
//  APIAuthTypeHeader.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 23.5.24..
//

import Foundation

enum APIAuthTypeHeader: String {
    case bearer = "Bearer"
    case bearerToken = "BearerToken"
    case basic = "Basic"
    case hash = "Hash"

    
    var authIdentifier: String {
        switch self {
        case .bearer:
            return "Bearer"
        case .basic:
            return "Basic"
        case .bearerToken:
            return "BearerToken"
        case .hash:
            return "Hash"
        }
    }
}
