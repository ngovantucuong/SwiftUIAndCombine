//
//  TypeFoodRow.swift
//  Login
//
//  Created by cuongnvt on 3/7/21.
//

import SwiftUI
import Kingfisher

struct TypeFoodRow: View {
    var nameCategory: String = ""
    @Binding var foods: [ResultListFood]
    @State var nameImageFood: String = ""
    @State private var isTransfer: Bool = false
    var body: some View {
        NavigationLink(
            destination: TypeFood(nameCategory: nameCategory,
                                  foods: foods),
            isActive: $isTransfer,
            label: {
                HStack {
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 7, content: {
                        Text(nameCategory)
                            .fontWeight(.bold)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text("120 Items")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    })
                    .frame(width: 280, height: 87, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .cornerRadius(30, corners: [.bottomLeft, .topLeft])
                    .cornerRadius(20, corners: [.bottomRight, .topRight])
                    .shadow(radius: 5)
                    .padding(.leading, -40)
                    .overlay(
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                KFImage(URL(string: nameImageFood))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipped()
                                    .cornerRadius(40)
                                    .padding(.leading, -70)
                            Spacer()
                            Button(action: {
                                isTransfer = true
                            }, label: {
                                Image("forward_circle")
                            })
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.trailing, -20)
                        })
                        , alignment: .leading)
                }
            })
    }
}

//struct TypeFoodRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TypeFoodRow(foods: foods)
//    }
//}
