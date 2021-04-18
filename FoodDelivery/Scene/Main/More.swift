//
//  More.swift
//  Login
//
//  Created by cuongnvt on 3/22/21.
//

import SwiftUI

struct More: View {
    var body: some View {
        NavigationView {
            MoreContent()
                .navigationBarItems(leading:
                                        Text("More")
                                    , trailing:
                                        Image("ic_cart")
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
        }
    }
}
struct MoreContent: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            RowMoreContent(nameImage: "ic_money", title: "Payment Details")
                .padding(.top, 31)
            RowMoreContent(nameImage: "ic_bag", title: "My Orders")
            RowMoreContent(nameImage: "ic_notify", title: "Notifications")
            RowMoreContent(nameImage: "ic_email", title: "Inbox")
            RowMoreContent(nameImage: "ic_about", title: "About Us")
            Spacer()
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.gray.opacity(0.3))
        
    }
}
struct RowMoreContent: View {
    var nameImage: String = ""
    var title: String = ""
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            Image(nameImage)
                .resizable()
                .scaledToFit()
                .padding(.leading, 13)
                .frame(width: 53, height: 53)
            Text(title)
            Spacer()
            
        })
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(5.0)
        .padding(.leading, 40)
        .padding(.trailing, 40)
        .overlay(
            HStack {
                Spacer()
                Image("ic_circles_gray")
                    .padding(.trailing, 30)
            }
            
        )
    }
}
struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}
