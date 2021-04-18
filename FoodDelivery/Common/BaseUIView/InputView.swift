//
//  InputView.swift
//  Login
//
//  Created by cuongnvt on 3/7/21.
//

import SwiftUI

struct InputView: View {
    var placeHolder: String
    @Binding var valueTextField: String
    @Binding var messageError: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField(placeHolder, text: $valueTextField)
                .padding(.leading, 34.0)
                .frame(height: 56, alignment: .leading)
                .background(Color("BackgroundInputViewColor"))
                .cornerRadius(30.0)
            .padding(.trailing, 34)
            .padding(.leading, 34)
            if !messageError.isEmpty {
                Text(messageError)
                    .foregroundColor(.red)
                    .padding(.leading, 34)
                    .padding(.top, 10)
            }
        }
    }
}
