//
//  APIService.swift
//  ExampleApp
//
//  Created by Lukáš Hromadník on 26/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

struct Recipe: Decodable {
    let id: String
    let name: String
    let duration: Int
    let score: Int
}

final class APIService {
    static let shared = APIService()
    private init() { }

    func fetchRecipes() {
        let url = URL(string: "https://cookbook.ack.ee/api/v1/recipes")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else {
                print("[NO DATA]")
                return
            }

            let result = try! JSONDecoder().decode([Recipe].self, from: data)
            print(result)
        }
        task.resume()
    }
}
