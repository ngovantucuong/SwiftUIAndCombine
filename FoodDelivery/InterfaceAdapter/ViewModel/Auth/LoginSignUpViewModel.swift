//
//  LoginSignUpViewModel.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import Combine
import  SwiftUI

class LoginSignUpViewModel: ObservableObject {
    // MARK: - Variable
    private var cancellableSet: Set<AnyCancellable> = []
    // MARK: - Subject
    @Published var isDisableButton: Bool = false
    @Published var isTapLogin: Bool = false
    @Published var isTapCreateAccount: Bool = false
    // MARK: - Private func
    // MARK: - Init
}
