//
//  TableSection.swift
//  ExampleApp
//
//  Created by Jakub Olejník on 12/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

enum TableSection: Int, CaseIterable, Hashable {
    case native, custom
    
    var title: String {
        switch self {
        case .native: return "Native"
        case .custom: return "Custom"
        }
    }
}
