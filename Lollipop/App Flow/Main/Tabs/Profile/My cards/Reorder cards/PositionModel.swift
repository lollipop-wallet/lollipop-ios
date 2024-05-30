//
//  PositionModel.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 30/05/2024.
//

import Foundation

struct MainPositionsModel: Codable {
    var cards: [PositionModel]
}

struct PositionModel: Codable {
    var alias: String
    var position: Int
}
