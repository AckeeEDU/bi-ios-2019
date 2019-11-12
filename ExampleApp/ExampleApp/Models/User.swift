//
//  User.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit

struct User {
    static let exampleData = [
        User(name: "Igor", description: "Eastern reinforcement 🇸🇰", color: .red),
        User(name: "Jakub", description: "🏎 enthusiast", color: .blue),
        User(name: "j.m.", description: "Smart 🏚 guru", color: .yellow),
        User(name: "Karel", description: "Gaming expert 🎮", color: .brown),
        User(name: "Lukáš 👱‍♂️", description: "Cables admirer (even in 2019 🤷‍♂️)", color: .cyan),
        User(name: "Marek", description: "Just geek 😂", color: .gray),
        User(name: "Slávek", description: "Code signing ninja 🤺", color: .green),
    ]
    
    let name: String
    let description: String
    let color: UIColor
}
