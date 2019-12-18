//
//  ExampleView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 17/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import SwiftUI

struct ExampleView: View {
    @State private var isShowingAlert = false
    @State private var textFieldContent = "Text"
    
    var body: some View {
        VStack(spacing: 20) {
            Image("img")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Let's call this a SwiftUI UILabel")
            
            TextField("Placeholder", text: $textFieldContent)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)

            Button(action: buttonTapped) {
                Text("Read textField value")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .alert(isPresented: $isShowingAlert, content: alertFactory)
    }
    
    private func buttonTapped() {
        isShowingAlert = true
    }
    
    private func alertFactory() -> Alert {
        Alert(title: Text("Current textField value is:"), message: Text(textFieldContent), dismissButton: .default(Text("OK")))
    }
}

struct ExampleView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ExampleView()
                .previewDevice("iPhone SE")
                .environment(\.colorScheme, .dark)
            
            ExampleView()
                .environment(\.colorScheme, .light)
        }.edgesIgnoringSafeArea(.all)
    }
}
