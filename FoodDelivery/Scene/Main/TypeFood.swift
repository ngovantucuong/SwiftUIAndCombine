//
//  TypeFood.swift
//  Login
//
//  Created by cuongnvt on 3/13/21.
//

import SwiftUI

struct TypeFood: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var nameCategory: String = ""
    @State var foods: [ResultListFood] = []
    var body: some View {
        ContentTypeFood(listFood: foods,
                        nameCategory: nameCategory)
            .navigationBarItems(leading:
                                    NavigationLink(destination: Menu(), label: {
                                        Image("ic_back_black")
                                    })
//                                    Button(action: {
////                                        self.presentationMode.wrappedValue.dismiss()
//                                    }) {
//                                        HStack(spacing: 6) {
//                                            Image("ic_back_black")
//                                            Text(nameCategory)
//                                        }
//                                    }
                , trailing: Image("ic_cart"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }
}

struct ContentTypeFood: View {
    var nameCategory: String = ""
    var listFoodFlowCategory: [Food] = []
    @State var listFood: [ResultListFood] = []
    @State var searchString: String = ""
    @State var isLike_One: Bool = false
    @State var isLike_Two: Bool = false
    @State var isLike_Three: Bool = false
    @State var isLike_Four: Bool = false
    @State var listNameFoodLike: [String] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
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
            .padding(.top, 20)
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                ForEach(listFoodFlowCategory, id: \.id) { data in
                    NavigationLink(
                        destination: DetailFood(price: data.price,
                                                nameFood: data.title,
                                                description: data.description,
                                                foodImageViewString: data.foodImageViewString,
                                                listNameFoodLike: $listNameFoodLike),
                        label: {
                            RowMenu(foodImageViewString: data.foodImageViewString,
                                    title: data.title,
                                    rateStart: data.rateStart,
                                    rate: data.rate,
                                    nameCategory: nameCategory,
                                    listNameFoodLike: $listNameFoodLike
                                    )
                        })
                }
            })
            .padding(.top, 19)
        })
    }
    init(listFood: [ResultListFood],
         nameCategory: String) {
        self.listFood = listFood
        self.nameCategory = nameCategory
        didFilterDataFlowCategory(nameCategory: nameCategory, listFood: listFood)
    }
    private mutating func didFilterDataFlowCategory(nameCategory: String,
                                           listFood: [ResultListFood]) {
        var arrayFood: [Food] = []
        listFood.forEach({ food in
            guard food.category?.elementsEqual(nameCategory) ?? false else { return }
            let food = Food(foodImageViewString: food.imageURL ?? "",
                            title: food.name ?? "",
                            rateStart: food.reviewRate ?? 0,
                            rate: food.reviewNumber ?? 0,
                            price: "\(food.price ?? 0)",
                            description: food.resultListFoodDescription ?? "")
            arrayFood.append(food)
        })
        listFoodFlowCategory = arrayFood
    }
}

struct TypeFood_Previews: PreviewProvider {
    static var previews: some View {
        TypeFood()
    }
}
