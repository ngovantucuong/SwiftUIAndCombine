//
//  Home.swift
//  Login
//
//  Created by cuongnvt on 2/21/21.
//

import SwiftUI

struct Offer: View {
    let dataFood: [Food] = [Food(foodImageViewString: "img_1",
                                    title: "Café de Noires",
                                    rateStart: 4,
                                    rate: 123),
                            Food(foodImageViewString: "img_2",
                                    title: "Isso",
                                    rateStart: 2,
                                    rate: 123),
                            Food(foodImageViewString: "img_3",
                                    title: "Cafe Beans",
                                    rateStart: 3,
                                    rate: 163)]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Latest Offers")
                    .font(Font.system(size: 30))
                    .padding(.leading, 21)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("ic_cart")
                })
                .padding(.trailing, 21)
            }
            Text("Find discounts, Offers special\nmeals and more!")
                .padding(.leading, 21)
                .padding(.top, 16)
                .foregroundColor(Color.gray)
            Button("Check Offers") {
                print("action")
            }
            .frame(width: 157, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(Font.system(size: 14))
            .foregroundColor(.white)
            .background(Color("OrganceColor"))
            .cornerRadius(16)
            .padding(.leading, 21)
            .padding(.top, 22)
            
            List {
                ForEach(dataFood, id: \.id) { food in
                    RowView(foodImageViewString: food.foodImageViewString,
                            title: food.title,
                            rateStart: food.rateStart,
                            rate: food.rate)
                }
            }
            .padding(.top, 22)
        }
        .navigationBarHidden(true)
    }
}
struct RowView: View {
    // MARK: - Property
    var foodImageViewString: String
    var title: String
    var rateStart: Int
    var rate: Int
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(foodImageViewString).padding(.leading, 0)
            VStack(alignment: .leading, spacing: 0, content: {
                Text(title)
                    .fontWeight(.medium)
                    .font(Font.system(size: 23))
                    .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                    Image("ic_start")
                    Text("\(rateStart, specifier: "%.1f")")
                        .padding(.leading, 4.2)
                    Text("(\(rate) ratings) Café")
                        .padding(.leading, 10)
                        .foregroundColor(Color("SecondTextColor"))
                    Image("ic_dot")
                        .resizable()
                        .frame(width: 4, height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 14)
                        .fixedSize()
                    Text("Western Food")
                        .padding(.leading, 2)
                        .foregroundColor(Color("SecondTextColor"))
                })
                .padding(.top, 8)
            })
            .padding(.leading, 21)
        }
        .padding(.bottom, 24.8)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 265, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Offer()
    }
}
