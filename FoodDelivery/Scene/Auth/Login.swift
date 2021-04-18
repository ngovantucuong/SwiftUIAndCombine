//
//  Login.swift
//  Login
//
//  Created by cuongnvt on 3/4/21.
//

import SwiftUI

struct Login: View {
    @ObservedObject private var viewModel = LoginViewModel()
    @State private var isPresented = false
    @State var isPresented1 = true
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            HeaderView(title_1: "Login", title_2: "Add your details to login")
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 28, content: {
                InputView(placeHolder: "Your Email",
                          valueTextField: $viewModel.email,
                          messageError: $viewModel.emailMessage)
                InputView(placeHolder: "Password",
                          valueTextField: $viewModel.password,
                          messageError: $viewModel.passwordMessage)
                ActivityIndicatorView(isPresented: $viewModel.isShowIndicator)
                BaseButton(text: "Login",
                           isDisableButton: $viewModel.isDisableButton,
                           isTapSignUp: $viewModel.isTapLogin)
                    .onReceive(viewModel.$isTransfer) { (value) in
                        guard value else { return }
                        self.isPresented = true
                    }
            })
            .padding(.top, 37)
            
            Text("Forgot your password?")
                .foregroundColor(.gray)
                .font(Font.system(size: 14, weight: .regular, design: .default))
                .padding(.top, 28)
            Text("or Login With")
                .foregroundColor(.gray)
                .font(Font.system(size: 14, weight: .regular, design: .default))
                .padding(.top, 54)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                BaseButton(text: "Login with Facebook",
                           nameIcon: "ic_fb",
                           backgroundView: .blue,
                           borderColor: .blue,
                           isDisableButton: $viewModel.isDisableButton,
                           isTapSignUp: $viewModel.isTapLogin)
                BaseButton(text: "Login with Google",
                           nameIcon: "ic_gmail",
                           backgroundView: .red,
                           borderColor: .red,
                           isDisableButton: $viewModel.isDisableButton,
                           isTapSignUp: $viewModel.isTapLogin)
            })
            HeaderFooter(leftTitle: "Don't have an Account?", righttTitle: "Sign Up")
                .padding(.top, 30)
            
        })
        .fullScreenCover(isPresented: $isPresented, content: ContentView.init)
        .navigationBarHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
