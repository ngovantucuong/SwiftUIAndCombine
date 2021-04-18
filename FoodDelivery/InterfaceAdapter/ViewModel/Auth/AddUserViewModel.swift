//
//  AddUserViewModel.swift
//  Login
//
//  Created by cuongnvt on 3/15/21.
//

import SwiftUI
import Combine

class AddUserViewModel: ObservableObject {
    private var cancellableSet: Set<AnyCancellable> = []
    private let addUserUseCaseImplement = AddUserUseCaseImplement()
    private let userDefaultService = ServiceFacade.getService(UserDefaultServiceable.self)
    // MARK: - Input
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var address: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isTapSignUp: Bool = false
    // MARK: - Output
    @Published var usernameMessage = ""
    @Published var emailMessage = ""
    @Published var addressMessage = ""
    @Published var passwordMessage = ""
    @Published var confirmPasswordMessage = ""
    @Published var isActiceButton: Bool = false
    @Published var isSignUpSuccess: Bool = false
    @Published var isShowIndicator: Bool = false
    // MARK: - Private func
    private func didValidateUserName() -> AnyPublisher<Bool, Never> {
        $name
            .combineLatest($isTapSignUp)
            .filter { $1 }
            .map { (nameString, _) in
                return nameString.checkInValidateInput()
            }
            .eraseToAnyPublisher()
    }
    private func didValidateEmail() -> AnyPublisher<Bool, Never> {
        $email
            .combineLatest($isTapSignUp)
            .filter { $1 }
            .map { (emailString, _) in
                return emailString.checkInValidateInput()
            }
            .eraseToAnyPublisher()
    }
    private func didValidateAddress() -> AnyPublisher<Bool, Never> {
        $address
            .combineLatest($isTapSignUp)
            .filter { $1 }
            .map { (addressString, _) in
                return addressString.checkInValidateInput()
            }
            .eraseToAnyPublisher()
    }
    private func didValidatePassword() -> AnyPublisher<Bool, Never> {
        $password
            .combineLatest($isTapSignUp)
            .filter { $1 }
            .map { (passwordString, _) in
                return passwordString.checkInValidateInput()
            }
            .eraseToAnyPublisher()
    }
    private func didValidateConfirmPassword() -> AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3($password, $confirmPassword, $isTapSignUp)
            .filter { $2 }
            .map { (password, confirmPassword, _) in
                password.elementsEqual(confirmPassword)
            }
            .eraseToAnyPublisher()
    }
    private func didCheckActiveSignUpButton(with name: String,
                                            email: String,
                                            address: String,
                                            groupPassword: (String, String)) -> Bool {
        return name.isEmpty ||
            email.isEmpty ||
            address.isEmpty ||
            groupPassword.0.isEmpty ||
            groupPassword.1.isEmpty
    }
    private func didCheckActiveButton() -> AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4($name, $email, $address,
                                  Publishers.CombineLatest($password, $confirmPassword))
            .map { [weak self] (name, email, address, password) -> Bool in
                guard let self = self else { return false }
                return self.didCheckActiveSignUpButton(with: name,
                                                        email: email,
                                                        address: address,
                                                        groupPassword: password)
            }
            .eraseToAnyPublisher()
    }
    private func didValidate() {
        didValidateUserName()
            .receive(on: RunLoop.main)
            .map { isValid in
                isValid ? "" : "Error input text"
            }
            .assign(to: \.usernameMessage, on: self)
            .store(in: &cancellableSet)
        didValidateEmail()
            .receive(on: RunLoop.main)
            .map { isValid in
                isValid ? "" : "Error input text"
            }
            .assign(to: \.emailMessage, on: self)
            .store(in: &cancellableSet)
        didValidateAddress()
            .receive(on: RunLoop.main)
            .map { isValid in
                isValid ? "" : "Error input text"
            }
            .assign(to: \.addressMessage, on: self)
            .store(in: &cancellableSet)
        didValidatePassword()
            .receive(on: RunLoop.main)
            .map { isValid in
                isValid ? "" : "Error input text"
            }
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellableSet)
        didValidateConfirmPassword()
            .map { isValid in
                isValid ? "" : "Passwords don't match"
            }
            .assign(to: \.confirmPasswordMessage, on: self)
            .store(in: &cancellableSet)
    }
    private func didSignUp() {
        $isTapSignUp
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .combineLatest(Publishers.CombineLatest4(didValidateUserName(), didValidateEmail(), didValidateAddress(), Publishers.CombineLatest(didValidatePassword(), didValidateConfirmPassword())))
            .filter { $0 && $1.0 && $1.1 && $1.2 && $1.3.0 && $1.3.1}
            .flatMap { _ -> AnyPublisher<ResultSearchListChildren?, RequestError> in
                self.isShowIndicator = true
                return self.addUserUseCaseImplement.didAddUser()
            }
            .sink(receiveCompletion: { _ in
                print("Complete")
            }) { (result) in
                guard let result = result else { return }
                self.isShowIndicator = false
                self.userDefaultService?.setValue(value: result.email, key: SaveKey.email)
                self.userDefaultService?.setValue(value: result.password, key: SaveKey.password)
                self.isSignUpSuccess = true
            }
            .store(in: &cancellableSet)
    }
    // MARK: - Init
    init() {
        didValidate()
        didSignUp()
        didCheckActiveButton()
            .receive(on: RunLoop.main)
            .assign(to: \.isActiceButton, on: self)
            .store(in: &cancellableSet)
    }
}
