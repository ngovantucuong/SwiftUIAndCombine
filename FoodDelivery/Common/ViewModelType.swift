//
//  ViewModelType.swift
//  Login
//
//  Created by cuongnvt on 3/16/21.
//

import Foundation

// MARK: - Protocol
protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
