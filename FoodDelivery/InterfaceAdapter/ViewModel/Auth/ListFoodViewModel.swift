//
//  ListFoodViewModel.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import SwiftUI
import Combine

class ListFoodViewModel: ObservableObject {
    // MARK: - Variable
    private var cancellableSet: Set<AnyCancellable> = []
    let listFoodUseCaseImplement = ListFoodUseCaseImplement()
    // MARK: - Output
    @Published var foods: [ResultListFood] = []
    @Published var categories: [MenuModel] = []
    @Published var isShowIndicator: Bool = false
    // MARK: - Private func
    private func didFilterCategories(foods: [ResultListFood]) {
        var category: [String] = []
        var categoryModel: [MenuModel] = []
        foods.forEach { (food) in
            let nameCategory = food.category ?? ""
            guard !category.contains(nameCategory) else { return }
            category.append(nameCategory)
            let menuModel = MenuModel(category: nameCategory,
                                      urlImage: food.imageURL ?? "")
            categoryModel.append(menuModel)
        }
        categories = categoryModel
        isShowIndicator = false
    }
    private func didGetListFood() {
        isShowIndicator = true
        listFoodUseCaseImplement.didGetListFood()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                print("COMPLETE!!!")
            }, receiveValue: { foods in
                self.foods = foods ?? []
                self.didFilterCategories(foods: foods ?? [])
            })
            .store(in: &cancellableSet)
    }
    // MARK: - Init
    init() {
        didGetListFood()
    }
}
