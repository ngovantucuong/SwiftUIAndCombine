//
//  BaseButton.swift
//  Login
//
//  Created by cuongnvt on 3/7/21.
//

import SwiftUI
import Combine

struct BaseButton: View {
    // MARK: - Variable
    var text: String
    @State var nameIcon: String = ""
    @State var backgroundView: Color = Color("OrganceColor")
    @State var borderColor: Color = Color("OrganceColor")
    @State var colorText: Color = .white
    @Binding var isDisableButton: Bool
    @Binding var isTapSignUp: Bool
    // MARK: - View
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 32.4, content: {
            if !nameIcon.isEmpty {
                Image(nameIcon)
            }
            Button(action: {
                isTapSignUp = true
            }, label: {
                Text(text)
                    .foregroundColor(colorText)
                    
            }).disabled(isDisableButton)
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 56, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .background(isDisableButton ? Color.gray :backgroundView)
        .cornerRadius(30.0)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                                .stroke(borderColor, lineWidth: 2)
        )
        .padding(.trailing, 34)
        .padding(.leading, 34)
    }
}
