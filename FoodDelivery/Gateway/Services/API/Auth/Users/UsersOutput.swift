//
//  UsersOutput.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking

// MARK: - SignUpOutput
class UsersOutput: NeoApiOutputable {
    var result: [ResultListUser]?
    var error: RequestError?
    var systemError: Error?
    var responseParser: Parseable = CodeableParser<[ResultListUser]>()
    var errorParser: Parseable = CodeableParser<RequestError>()
}
// MARK: - ResultSearchListChildren
// MARK: - ResultGetListContactElement
struct ResultListUser: Codable {
    let id, createdAt, name, email: String
    let phoneNumber, address, password: String
}
