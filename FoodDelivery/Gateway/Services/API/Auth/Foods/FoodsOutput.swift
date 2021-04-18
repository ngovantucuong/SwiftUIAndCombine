//
//  FoodsOutput.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking

// MARK: - SignUpOutput
class FoodsOutput: NeoApiOutputable {
    var result: [ResultListFood]?
    var error: RequestError?
    var systemError: Error?
    var responseParser: Parseable = CodeableParser<[ResultListFood]>()
    var errorParser: Parseable = CodeableParser<RequestError>()
}
// MARK: - ResultListFood
struct ResultListFood: Identifiable, Codable {
    let id, createdAt: String?
    let imageURL: String?
    let name: String?
    let reviewRate, reviewNumber, price: Int?
    let resultListFoodDescription: String?
    let category: String?
    let isFavorite: Bool?
    let country: String?
    let restaurent: String?
    let author: String?

    enum CodingKeys: String, CodingKey {
        case id, createdAt
        case imageURL = "imageUrl"
        case name
        case reviewRate = "review_rate"
        case reviewNumber = "review_number"
        case price
        case resultListFoodDescription = "description"
        case category
        case isFavorite = "is_favorite"
        case country, restaurent, author
    }
}
