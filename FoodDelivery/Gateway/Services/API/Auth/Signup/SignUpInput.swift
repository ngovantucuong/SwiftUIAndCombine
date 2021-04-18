//
//  LoginInput.swift
//  Jinjer_Kindergarten
//
//  Created by cuongnvt on 11/12/20.
//

import NeoNetworking

class SignUpInput: NeoApiInputable {
    // MARK: Variable
    var requestType: NeoRequestType = .post
    var pathToApi: String = "/users"
    // MARK: Init
    init() {
    }
    // MARK: Function
    func makeRequestableBody() -> [String: Any] {
        return [:]
    }
    func makeRequestableHeader() -> [String: String] {
        return [:]
    }
}
