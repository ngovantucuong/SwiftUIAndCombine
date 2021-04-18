//
//  Menu.swift
//  Login
//
//  Created by cuongnvt on 2/21/21.
//

import SwiftUI
import Combine

struct MenuModel: Identifiable, Codable {
    var id = UUID()
    var category: String
    var urlImage: String
}

struct Menu: View {
    var body: some View {
        NavigationView {
            ContentMenu()
                .navigationBarItems(leading:
                                        Text("Menu")
                                    , trailing:
                                        Image("ic_cart")
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentMenu: View {
    @ObservedObject private var viewModel = ListFoodViewModel()
    @State var searchString: String = ""
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                HStack {
                    Image("ic_search")
                        .padding(.leading, 20)
                    TextField("Search Food", text: $searchString)
                        .padding(.leading, 15.5)
                        .onChange(of: searchString, perform: { value in
                            print("in raaa\(value)")
                        })
                }
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color("BackgroundMainColor"))
                .cornerRadius(30)
                .padding([.leading, .trailing], 21)
                ActivityIndicatorView(isPresented: $viewModel.isShowIndicator)
                Text("")
                    .frame(width: 97, height: 485, alignment: .leading)
                    .background(Color("OrganceColor"))
                    .cornerRadius(40, corners: [.topRight, .bottomRight])
                    .padding(.top, 30)
                    .overlay(
                        VStack(alignment: .leading, spacing: 24, content: {
                            ForEach(viewModel.categories, id: \.id) { data in
                                TypeFoodRow(nameCategory: data.category,
                                            foods: $viewModel.foods,
                                            nameImageFood: data.urlImage)
                                    .padding(.leading, 100)
                            }
                        })
                ,alignment: .leading)
            })
        })
    }
}
