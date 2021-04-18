//
//  Signup.swift
//  Login
//
//  Created by cuongnvt on 3/6/21.
//

import SwiftUI
import Combine

struct SignUp: View {
    // MARK: - Variable
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel = AddUserViewModel()
    @State var isTransfer: Bool = false
    // MARK: - View
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            ActivityIndicatorView(isPresented: $viewModel.isShowIndicator)
            HeaderView(title_1: "Sign Up", title_2: "Add your details to sign up")
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 28, content: {
                InputView(placeHolder: "Name", valueTextField: $viewModel.name, messageError: $viewModel.usernameMessage)
                InputView(placeHolder: "Email", valueTextField: $viewModel.email, messageError: $viewModel.emailMessage)
                InputView(placeHolder: "Address", valueTextField: $viewModel.address, messageError: $viewModel.addressMessage)
                InputView(placeHolder: "Password", valueTextField: $viewModel.password, messageError: $viewModel.passwordMessage)
                InputView(placeHolder: "Confirm Password", valueTextField: $viewModel.confirmPassword, messageError: $viewModel.confirmPasswordMessage)
                BaseButton(text: "Sign Up",
                           isDisableButton: $viewModel.isActiceButton,
                           isTapSignUp: $viewModel.isTapSignUp)
            })
            .padding(.top, 38)
            HeaderFooter(leftTitle: "Already have an Account? ", righttTitle: "Login")
                .padding(.top, 20)
        })
        .alert(isPresented: $viewModel.isSignUpSuccess) {
            Alert(title: Text("Food Delivery"), message: Text("Sign up success!!!"), dismissButton: .default(Text("Ok"), action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
        .navigationBarHidden(true)
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
