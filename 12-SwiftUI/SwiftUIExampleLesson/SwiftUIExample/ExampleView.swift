//
//  ExampleView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 18/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import SwiftUI

struct ExampleView: View {
    @State var textFieldValue = ""
    @State var isSheetVisible = false
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Enter value", text: $textFieldValue)
            Button(action: buttonTapped) {
                Text("Submit")
            }
        }
        .actionSheet(isPresented: $isSheetVisible) {
            ActionSheet(title: Text("Title"), message: Text("message"), buttons: [
                .destructive(Text("Destructive")),
                .cancel()
            ])
        }
    }
    
    private func buttonTapped() {
        isSheetVisible = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
