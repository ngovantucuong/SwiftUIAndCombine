//
//  FoodsInput.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking

class FoodsInput: NeoApiInputable {
    // MARK: Variable
    var requestType: NeoRequestType = .get
    var pathToApi: String = "/foods"
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
