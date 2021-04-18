//
//  LoginSignup.swift
//  Login
//
//  Created by cuongnvt on 3/6/21.
//

import SwiftUI
import Combine

struct LoginSignUp: View {
    @ObservedObject private var viewModel = LoginSignUpViewModel()
    @State var isDisableButton: Bool = false
    @State var isTapSignUp: Bool = true
    var body: some View {
        NavigationView(content: {
            LoginSignUpContentView(viewModel: viewModel)
                .navigationBarHidden(true)
        })
    }
}

struct LoginSignUpContentView: View {
    @ObservedObject var viewModel: LoginSignUpViewModel
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
            GeometryReader(content: { geometry in
                Image("shape_organce_img")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: geometry.size.height / 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Image("Logo")
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height: 184, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.top, geometry.size.height / 3 + 20)
                    Text("Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.top, 45)
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                        NavigationLink(
                            destination: Login(),
                            isActive: $viewModel.isTapLogin,
                            label: {
                                BaseButton(text: "Login",
                                           isDisableButton: $viewModel.isDisableButton,
                                           isTapSignUp: $viewModel.isTapLogin)
                            })
                        NavigationLink(
                            destination: SignUp(),
                            isActive: $viewModel.isTapCreateAccount,
                            label: {
                                BaseButton(text: "Create an Account",
                                           nameIcon: "",
                                           backgroundView: .white,
                                           borderColor: Color("OrganceColor"),
                                           colorText: Color("OrganceColor"),
                                           isDisableButton: $viewModel.isDisableButton,
                                           isTapSignUp: $viewModel.isTapCreateAccount)
                            })
                    })
                    .padding(.top, 36)
                })
            })
        })
        .ignoresSafeArea()
    }
}

struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignUp()
    }
}
