//
//  APIService.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() { }

    func fetchRecipes() {
        let url = URL(string: "https://cookbook.ack.ee/api/v1/recipes")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("[DATA]", data)
            print("[RESPONSE]", response)
            print("[ERROR]", error)
        }
        task.resume()
    }
}
