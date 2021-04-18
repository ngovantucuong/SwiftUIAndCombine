//
//  LoginAPI.swift
//  Jinjer_Kindergarten
//
//  Created by cuongnvt on 11/12/20.
//

import NeoNetworking

class SignUpAPI: NeoRequestable {
    // MARK: Variable
    var input: SignUpInput
    var output: SignUpOutput
    // MARK: Init
    init(
        with input: SignUpInput,
        and output: SignUpOutput) {
        self.input = input
        self.output = output
    }
    // MARK: Function
    func getOutput() -> SignUpOutput? {
        return self.output
    }
}
