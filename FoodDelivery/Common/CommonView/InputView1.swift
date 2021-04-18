//
//  InputView.swift
//  Login
//
//  Created by cuongnvt on 1/16/21.
//

import SwiftUI

struct InputView1: View {
    var headerText: String
    var placeHolder: String
    var isPassword: Bool
    
    // State
    @State var valueTextField: String
    var body: some View {
        VStack(alignment: .leading, spacing: 7, content: {
            Text(headerText).font(Font.system(size: 15)).foregroundColor(.init("TextColor"))
            if isPassword {
                SecureField(placeHolder, text: $valueTextField)
                    .padding([.leading,.trailing], 22)
                    .frame(height: 40)
                    .border(Color("BorderColor"), width: 1)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(Color("TextColor"))
                    .background(Color.white)
            } else {
                TextField(placeHolder, text: $valueTextField)
                    .padding([.leading,.trailing], 22)
                    .frame(height: 40)
                    .border(Color("BorderColor"), width: 1)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(Color("TextColor"))
                    .background(Color.white)
            }
        }).padding([.leading, .trailing], 26)
    }
}
