//
//  Recipe.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

struct Recipe {
    let identifier: String
    let name: String
    let duration: Int
    let score: Double
}

extension Recipe: Codable {
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case duration
        case score
    }
}
