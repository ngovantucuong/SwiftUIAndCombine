//
//  LoginViewModel.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    private var cancellableSet: Set<AnyCancellable> = []
    private let loginUseCaseImplement = LoginUseCaseImplement()
    private let userDefaultService = ServiceFacade.getService(UserDefaultServiceable.self)
    // MARK: - Subject
    @Published var isDisableButton: Bool = false
    @Published var isTapLogin: Bool = false
    // MARK: - Input
    @Published var email: String = ""
    @Published var password: String = ""
    // MARK: - Output
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var isTransfer: Bool = false
    @Published var isShowIndicator: Bool = false
    // MARK: - Private func
    private func didCheckExitsUser(users: [ResultListUser],
                                   email: String,
                                   password: String) {
        users.forEach { (user) in
            guard user.email == email && user.password == password else { return }
            self.isShowIndicator = false
            isTransfer = true
            return
        }
    }
    private func didLogin() {
        $isTapLogin
            .receive(on: RunLoop.main)
            .filter { $0 }
            .map { _ in
                self.isShowIndicator = true
                self.loginUseCaseImplement.didGetListUser()
                    .receive(on: RunLoop.main)
                    .sink(receiveCompletion: { _ in
                        print("COMPLETE!!!")
                    }, receiveValue: { users in
                        self.didCheckExitsUser(users: users ?? [],
                                               email: self.email,
                                               password: self.password)
                    })
                    .store(in: &self.cancellableSet)
            }
            .sink(receiveValue: { _ in
            })
            .store(in: &cancellableSet)
    }
    init() {
        email = userDefaultService?.getValue(key: SaveKey.email) ?? ""
        password = userDefaultService?.getValue(key: SaveKey.password) ?? ""
        didLogin()
    }
}
