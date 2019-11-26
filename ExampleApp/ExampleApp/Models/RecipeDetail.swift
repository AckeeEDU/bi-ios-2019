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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(String.self, forKey: .identifier)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        duration = try container.decode(Int.self, forKey: .duration)
        score = try container.decode(Double.self, forKey: .score)
        info = try container.decode(String.self, forKey: .info)
        ingredients = try container.decodeIfPresent([String].self, forKey: .ingredients) ?? []
    }
}
