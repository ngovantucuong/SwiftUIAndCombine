//
//  RowMenu.swift
//  Login
//
//  Created by cuongnvt on 3/13/21.
//

import SwiftUI
import Kingfisher

struct RowMenu: View {
    // MARK: - Property
    var foodImageViewString: String
    var title: String
    var rateStart: Int
    var rate: Int
    var nameCategory: String = ""
    @Binding var listNameFoodLike: [String]
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            KFImage(URL(string: foodImageViewString))
                .resizable()
                .scaledToFill()
                .frame(height: 193)
                .clipped()
            
            VStack(alignment: .leading, spacing: 0, content: {
                if listNameFoodLike.contains(title) {
                    Image("ic_heart")
                        .padding(.bottom, 20)
                        .padding(.leading, 270)
                }
                
                Text(title)
                    .fontWeight(.medium)
                    .font(Font.system(size: 23))
                    .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                    Image("ic_start")
                    Text("\(rateStart)")
                        .padding(.leading, 4.2)
                        .foregroundColor(Color.red)
                    Text("(\(rate) ratings) Café")
                        .padding(.leading, 10)
                        .foregroundColor(Color.white)
                    Image("ic_dot")
                        .resizable()
                        .frame(width: 4, height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 14)
                        .fixedSize()
                    Text(nameCategory)
                        .padding(.leading, 2)
                        .foregroundColor(Color.white)
                })
                .padding(.top, 8)
            })
            .padding(.leading, 21)
            .padding(.bottom, 30)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, alignment: .bottomLeading)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top))
        })
    }
}
