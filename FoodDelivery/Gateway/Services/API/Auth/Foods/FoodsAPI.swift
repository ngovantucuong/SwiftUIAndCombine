//
//  FoodsAPI.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking

class FoodsAPI: NeoRequestable {
    // MARK: Variable
    var input: FoodsInput
    var output: FoodsOutput
    // MARK: Init
    init(
        with input: FoodsInput,
        and output: FoodsOutput) {
        self.input = input
        self.output = output
    }
    // MARK: Function
    func getOutput() -> FoodsOutput? {
        return self.output
    }
}
