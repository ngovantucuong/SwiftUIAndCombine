//
//  LoginUseCaseable.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking
import Combine

// MARK: Protocol
protocol LoginUseCaseable {
    func didGetListUser() -> AnyPublisher<[ResultListUser]?, RequestError>
}

class LoginUseCaseImplement: LoginUseCaseable {
    // MARK: Variable
    var networkProvider: NeoNetworkProviable? {
        return ServiceFacade.getService(NeoNetworkProviable.self)
    }
    // MARK: Function
    func didGetListUser() -> AnyPublisher<[ResultListUser]?, RequestError> {
        guard let apiService = networkProvider else { return Result.Publisher(nil).eraseToAnyPublisher() }
        let input = UsersInput()
        let request = UsersAPI(with: input, and: UsersOutput())
        return Future<[ResultListUser]?, RequestError> { promise in
            apiService.load(api: request) { (response) in
                guard let result = response.getOutput()?.result else { return }
                return promise(.success(result))
            } onRequestError: { (response) in
                guard let error = response.getOutput()?.error else { return }
                promise(.failure(error))
            } onServerError: { error in
            }
        }.eraseToAnyPublisher()
    }
}
