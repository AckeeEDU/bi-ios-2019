//
//  RecipeDetail.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

struct RecipeDetail {
    let identifier: String
    let name: String
    let description: String
    let duration: Int
    let score: Double
    let info: String
    let ingredients: [String]
}

extension RecipeDetail: Codable {
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case description
        case duration
        case score
        case info
        case ingredients
    }
}
