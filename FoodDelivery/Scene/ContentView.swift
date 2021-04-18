//
//  ContentView.swift
//  Login
//
//  Created by cuongnvt on 1/16/21.
//

import SwiftUI

struct Food: Identifiable, Codable {
    var id = UUID()
    var foodImageViewString: String
    var title: String
    var rateStart: Int
    var rate: Int
    var price: String = ""
    var description: String = ""
}

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var name = "Emilia Clarke"
    @State var email: String = "emiliaclarke@email.com"
    @State var mobile: String = "emiliaclarke@email.com"
    @State var address: String = "No 23, 6th Lane, Colombo 03"
    @State var password: String = "**************"
    @State var confirmPassword: String = "**************"
    var body: some View {
        TabView(selection: $selectedTab) {
            Menu()
                .tabItem {
                    if selectedTab == 0 {
                        Image("ic_menu")
                            .renderingMode(.template).foregroundColor(Color.red)
                    } else {
                        Image("ic_menu").renderingMode(.original)
                    }
                    Text("Menu")
                }
                .tag(0)
            
            Offer()
                .tabItem {
                    if selectedTab == 1 {
                        Image("ic_offer")
                            .renderingMode(.template).foregroundColor(Color.red)
                    } else {
                        Image("ic_offer").renderingMode(.original)
                    }
                    Text("Offers")
                }
                .tag(1)
            Text("Tab 3")
                .tabItem {
                    if selectedTab == 2 {
                        Image("ic_home")
                            .renderingMode(.template).foregroundColor(Color.red)
                    } else {
                        Image("ic_home")
                            .renderingMode(.template)
                            .foregroundColor(Color("GrayTabbarColor"))
                    }
                    Text("Home")
                }
                .tag(2)
            Profile(name: $name,
                    email: $email,
                    mobile: $mobile,
                    address: $address,
                    password: $password,
                    confirmPassword: $confirmPassword)
                .tabItem {
                    if selectedTab == 3 {
                        Image("ic_profile")
                            .renderingMode(.template).foregroundColor(Color.red)
                    } else {
                        Image("ic_profile").renderingMode(.original)
                    }
                    Text("Profile")
                }
                .tag(3)
            More()
                .tabItem {
                    if selectedTab == 4 {
                        Image("ic_more")
                            .renderingMode(.template).foregroundColor(Color.red)
                    } else {
                        Image("ic_more").renderingMode(.original)
                    }
                    Text("More")
                }
                .tag(4)
        }
        .onAppear(perform: {
            UITabBar.appearance().barTintColor = .clear
            UINavigationBar.appearance().backgroundColor = .clear
        })
        .accentColor(.red)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


