//
//  Ingredient.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

struct Ingredient {
    let text: String
}

extension Ingredient: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        text = try container.decode(String.self)
    }
}
