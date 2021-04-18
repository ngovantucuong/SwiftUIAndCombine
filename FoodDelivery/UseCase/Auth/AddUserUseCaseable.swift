//
//  AddUserUseCaseable.swift
//  Login
//
//  Created by cuongnvt on 3/15/21.
//

import NeoNetworking
import Combine

// MARK: Protocol
protocol AddUserUseCaseable {
    func didAddUser() -> AnyPublisher<ResultSearchListChildren?, RequestError>
}

class AddUserUseCaseImplement: AddUserUseCaseable {
    // MARK: Variable
    var networkProvider: NeoNetworkProviable? {
        return ServiceFacade.getService(NeoNetworkProviable.self)
    }
    // MARK: Function
    func didAddUser() -> AnyPublisher<ResultSearchListChildren?, RequestError> {
        guard let apiService = networkProvider else { return Result.Publisher(nil).eraseToAnyPublisher() }
        let input = SignUpInput()
        let request = SignUpAPI(with: input, and: SignUpOutput())
        return Future<ResultSearchListChildren?, RequestError> { promise in
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
