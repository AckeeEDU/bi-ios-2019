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

    func fetchRecipes(_ completion: @escaping (([Recipe]) -> Void)) {
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
            completion(result)
        }
        task.resume()
    }

    func fetchRecipeDetail(recipe: Recipe, _ completion: @escaping ((RecipeDetail) -> Void)) {
        let url = URL(string: "https://cookbook.ack.ee/api/v1/recipes/\(recipe.identifier)")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else {
                print("[NO DATA]")
                return
            }

            let result = try! JSONDecoder().decode(RecipeDetail.self, from: data)
            completion(result)
        }
        task.resume()
    }

    func rate(_ score: Int, recipe: Recipe, _ completion: @escaping (() -> Void)) {
        let url = URL(string: "https://cookbook.ack.ee/api/v1/recipes/\(recipe.identifier)/ratings")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = ["score": score]
        request.httpBody = try! JSONSerialization.data(withJSONObject: data)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error)
                return
            }

            completion()
        }
        task.resume()
    }
}
