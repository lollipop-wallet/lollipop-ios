//
//  JSONEncoder+Extension.swift
//  Lollipop
//
//  Creawted by Aleksandar Draskovic on 30/05/2024.
//

import Foundation
import SwiftyJSON

extension JSONEncoder {
    static func encode<T: Encodable>(from data: T, completion: ((Bool, String) -> Void)? = nil){
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let json = try jsonEncoder.encode(data)
            let jsonString = String(data: json, encoding: .utf8)
            completion?(true, (jsonString ?? ""))
        } catch {
            completion?(false, "")
            print(error.localizedDescription)
        }
    }
}
