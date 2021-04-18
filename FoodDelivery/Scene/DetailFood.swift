//
//  DetailFood.swift
//  Login
//
//  Created by cuongnvt on 2/21/21.
//

import SwiftUI
import Kingfisher

struct DetailFood: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var price: String
    var nameFood: String
    var description: String
    var foodImageViewString: String
    @Binding var listNameFoodLike: [String]
    var body: some View {
        ContentDetailFood(price: price,
                          nameFood: nameFood,
                          description: description,
                          foodImageViewString: foodImageViewString,
                          listNameFoodLike: listNameFoodLike)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image("ic_back_white")
                                    })
                                , trailing:
                                    Image("ic_cart_white")
            )
            .navigationBarBackButtonHidden(true)
    }
}
struct ContentDetailFood: View {
    var price: String
    var nameFood: String
    var description: String
    var foodImageViewString: String
    @State var listNameFoodLike: [String] = []
    var body: some View {
        ZStack(alignment: .top) {
            KFImage(URL(string: foodImageViewString))
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.size.height)
                .clipped()
                .ignoresSafeArea()
            MainContent(price: price,
                        nameFood: nameFood,
                        description: description,
                        listNameFoodLike: listNameFoodLike)
        }
    }
}
struct MainContent: View {
    var price: String
    var nameFood: String
    var description: String
    @State var listNameFoodLike: [String] = []
    var body: some View {
        ScrollView() {
            VStack() {
                Spacer()
                    .frame(height: 300)
                VStack {
                    BottomDetailFoodView.init(price: price,
                                              nameFood: nameFood,
                                              description: description,
                                              listNameFoodLike: $listNameFoodLike)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
struct BottomDetailFoodView: View {
    var price: String
    var nameFood: String
    var description: String
    @Binding var listNameFoodLike: [String]
    @State var valueText: Int = 0
    var body: some View {
        VStack(alignment: .leading) {
            TopDetailFood(nameFood: nameFood, price: price)
            DescriptionView(description: description)
            Divider()
                .padding(.trailing, 22)
            Text("Customize your Order")
                .font(Font.system(.headline))
            VStack {
                DropView(title: "- Select the size of portion -")
                DropView(title: "- Select the ingredients -")
                HStack(alignment: .center, spacing: nil) {
                    Text("Number of Portions")
                    HStack(alignment: .center, spacing: nil) {
                        Button(action: {
                            valueText -= 1
                        }) {
                            Text("-")
                                .foregroundColor(.white)
                        }
                        .frame(width: 52, height: 30)
                        .background(Color("OrganceColor"))
                        .cornerRadius(30.0)
                        Text("\(valueText)")
                            .frame(width: 52, height: 30)
                            .cornerRadius(30.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                                    .stroke(Color("OrganceColor"), lineWidth: 2)
                            )
                        Button(action: {
                            valueText += 1
                        }) {
                            Text("+")
                                .foregroundColor(.white)
                        }
                        .frame(width: 52, height: 30)
                        .background(Color("OrganceColor"))
                        .cornerRadius(30.0)
                    }
                }
                .padding(.bottom, 27)
                .padding(.top, 24)
            }.padding(.trailing, 22)
            Text("")
                .frame(width: 97, height: 171, alignment: .leading)
                .background(Color("OrganceColor"))
                .cornerRadius(40, corners: [.topRight, .bottomRight])
                .overlay(
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        Text("Total Price")
                            .font(Font.system(size: 12.0))
                        Text("LKR 1500")
                            .font(Font.system(size: 21.0, weight: .bold, design: .default))
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack(alignment: .center, content: {
                                Image("ic_cart_white-1")
                                    .padding(.leading, 20)
                                Spacer()
                                Text("Add to Cart")
                                    .font(Font.system(size: 11.0))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 30)
                            })
                        })
                        .frame(width: 157, height: 29, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color("OrganceColor"))
                        .cornerRadius(20.0)
                    })
                    .frame(width: 277, height: 142)
                    .background(Color.white)
                    .cornerRadius(40, corners: [.topLeft, .bottomLeft])
                    .cornerRadius(12, corners: [.topRight, .bottomRight])
                    .padding(.leading, 280)
                    .overlay(
                        HStack {
                            Spacer()
                            Image("ic_cart_orange_circle")
                                .frame(width: 47, height: 47)
                                .padding(.trailing, -23)
                        }
                    )
                    .shadow(radius: 5)
                )
        }
        .padding(.leading, 22)
        .frame(width: UIScreen.main.bounds.width,
//               height: UIScreen.main.bounds.height * 0.7,
               alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(40, corners: [.topLeft, .topRight])
        .overlay(
            VStack {
                Button(action: {
                    listNameFoodLike.append(nameFood)
                }, label: {
                    Image("ic_heart")
                })
                .padding(.top, -30)
                .padding(.trailing, 10)
                Spacer()
            }
        ,
        alignment: .trailing
        )
    }
}
struct TopDetailFood: View {
    var nameFood: String
    var price: String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
            VStack {
                Text("Rs. \(price)")
                    .font(Font.system(size: 33))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("/ per Portion")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.trailing, 22)
            .padding(.top, 77)

            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                
                Text(nameFood)
                    .padding(.top, 36)
                    .font(Font.system(size: 23))
                
                HStack {
                    Image("ic_start_red")
                    Image("ic_start_red")
                    Image("ic_start_red")
                    Image("ic_start_red")
                    Image("ic_start_empty")
                }
                Text("4 Star Ratings")
                    .font(Font.system(size: 11))
                    .foregroundColor(.red)
            })
        })
    }
}
struct DescriptionView: View {
    var description: String
    var body: some View {
        Text("Description")
            .font(Font.system(size: 17))
            .padding(.top, 0)
        Text(description)
            .font(Font.system(size: 13))
            .padding(.top, 3)
            .foregroundColor(.gray)
    }
}

//struct DetailFood_Previews: PreviewProvider {
//    static var previews: some View {
////        DetailFood(nameFood: "nameFood", listNameFoodLike: .constant(["Like name 1", "Like name 2"]))
//    }
//}
