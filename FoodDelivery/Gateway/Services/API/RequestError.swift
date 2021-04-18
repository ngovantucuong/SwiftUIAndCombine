//
//  AppError.swift
//  Jinjer_Kindergarten
//
//  Created by NeoLab on 2/3/21.
//

import Foundation

class RequestError: Codable, Error {
    let message: String?
    let statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case statusCode = "status_code"
    }
}
