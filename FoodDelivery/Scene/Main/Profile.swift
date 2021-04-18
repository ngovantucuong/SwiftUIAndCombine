//
//  Profile.swift
//  Login
//
//  Created by cuongnvt on 3/22/21.
//

import SwiftUI

struct Profile: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var mobile: String
    @Binding var address: String
    @Binding var password: String
    @Binding var confirmPassword: String
    var body: some View {
        NavigationView {
            ProfileContent(name: $name,
                           email: $email,
                           mobile: $mobile,
                           address: $address,
                           password: $password,
                           confirmPassword: $confirmPassword)
                .navigationBarItems(leading:
                                        Text("Profile")
                                    , trailing:
                                        Image("ic_cart")
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
        }
    }
}
struct ProfileContent: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var mobile: String
    @Binding var address: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @State var isDisableButton: Bool = false
    @State var isTapSignUp: Bool = false
    var body: some View {
        ScrollView(content: {
            VStack(alignment: .center, spacing: nil) {
                VStack {
                    Image("ic_ava")
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Image("ic_pencil")
                        Text("Edit Profile")
                            .foregroundColor(Color("OrganceColor"))
                            .font(Font.system(size: 12))
                    })
                    Text("Hi there Emilia!")
                        .font(.title2)
                    Text("Sign Out")
                        .foregroundColor(Color.gray.opacity(0.6))
                        .font(Font.system(size: 12))
                }
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 17, content: {
                    RowProfile(title: "Name", placeHolder: "Emilia Clarke", name: $name)
                    RowProfile(title: "Email", placeHolder: "emiliaclarke@email.com", name: $email)
                    RowProfile(title: "Mobile No", placeHolder: "emiliaclarke@email.com", name: $mobile)
                    RowProfile(title: "Address", placeHolder: "No 23, 6th Lane, Colombo 03", name: $address)
                    RowProfile(title: "Password", placeHolder: "**************", name: $password)
                    RowProfile(title: "Confirm Password", placeHolder: "**************", name: $confirmPassword)
                    BaseButton(text: "Save", isDisableButton: $isDisableButton, isTapSignUp: $isTapSignUp)
                })
                .padding(.top, 47)
            }
        })
    }
}
struct RowProfile: View {
    var title: String
    var placeHolder: String
    @Binding var name: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Text(title)
                .foregroundColor(Color.gray.opacity(0.6))
                .font(Font.system(size: 12))
                .padding(.leading, 40)
            TextField("Emilia Clarke", text: $name)
                .foregroundColor(Color.black)
                .font(Font.system(size: 20))
                .padding(.leading, 40)
        })
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .frame(height: 56)
        .background(Color("BackgroundInputViewColor"))
        .cornerRadius(30)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}
