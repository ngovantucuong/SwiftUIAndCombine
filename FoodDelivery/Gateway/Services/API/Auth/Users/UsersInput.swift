//
//  UsersInput.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking

class UsersInput: NeoApiInputable {
    // MARK: Variable
    var requestType: NeoRequestType = .get
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
