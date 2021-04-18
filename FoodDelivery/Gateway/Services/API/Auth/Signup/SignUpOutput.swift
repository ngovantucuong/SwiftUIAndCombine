//
//  LoginOutput.swift
//  Jinjer_Kindergarten
//
//  Created by cuongnvt on 11/12/20.
//

import NeoNetworking

// MARK: - SignUpOutput
class SignUpOutput: NeoApiOutputable {
    var result: ResultSearchListChildren?
    var error: RequestError?
    var systemError: Error?
    var responseParser: Parseable = CodeableParser<ResultSearchListChildren>()
    var errorParser: Parseable = CodeableParser<RequestError>()
}
// MARK: - ResultSearchListChildren
struct ResultSearchListChildren: Codable {
    let id, createdAt, name, email: String
    let phoneNumber, address, password: String
}
