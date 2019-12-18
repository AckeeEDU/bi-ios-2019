//
//  ViewExtensions.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 18/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import SwiftUI

extension View {
    public func enabled(_ enabled: Bool) -> some View {
        disabled(!enabled)
    }
}
