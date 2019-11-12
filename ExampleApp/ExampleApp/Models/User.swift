//
//  User.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

struct User {
    static let exampleData = [
        User(name: "Igor", description: "Eastern reinforcement 🇸🇰"),
        User(name: "Jakub", description: "🏎 enthusiast"),
        User(name: "j.m.", description: "Smart 🏚 guru"),
        User(name: "Karel", description: "Gaming expert 🎮"),
        User(name: "Lukáš 👱‍♂️", description: "Cables admirer (even in 2019 🤷‍♂️)"),
        User(name: "Marek", description: "Just geek 😂"),
        User(name: "Slávek", description: "Code signing ninja 🤺"),
    ]
    
    let name: String
    let description: String
}
