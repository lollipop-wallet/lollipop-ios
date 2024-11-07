//
//  APIHeader.swift
//  VideoAI
//
//  Created by Aleksandar Draskovic on 24/02/2024.
//

import Foundation

enum HTTPHeaderField: String {
    case authorization = "Authorization"
    case firauthorization = "Firebase-Auth"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case refresh = "Refresh-Token"
    case branding = "Branding-Type"
    case acceptRanges = "Accept-Ranges"
    case platform = "X-Platform"
}
