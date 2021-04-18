//
//  UsersAPI.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking

class UsersAPI: NeoRequestable {
    // MARK: Variable
    var input: UsersInput
    var output: UsersOutput
    // MARK: Init
    init(
        with input: UsersInput,
        and output: UsersOutput) {
        self.input = input
        self.output = output
    }
    // MARK: Function
    func getOutput() -> UsersOutput? {
        return self.output
    }
}
