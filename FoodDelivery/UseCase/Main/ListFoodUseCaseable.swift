//
//  ListFoodUseCaseable.swift
//  Login
//
//  Created by cuongnvt on 3/21/21.
//

import NeoNetworking
import Combine

// MARK: Protocol
protocol ListFoodUseCaseable {
    func didGetListFood() -> AnyPublisher<[ResultListFood]?, RequestError>
}

class ListFoodUseCaseImplement: ListFoodUseCaseable {
    // MARK: Variable
    var networkProvider: NeoNetworkProviable? {
        return ServiceFacade.getService(NeoNetworkProviable.self)
    }
    // MARK: Function
    func didGetListFood() -> AnyPublisher<[ResultListFood]?, RequestError> {
        guard let apiService = networkProvider else { return Result.Publisher(nil).eraseToAnyPublisher() }
        let input = FoodsInput()
        let request = FoodsAPI(with: input, and: FoodsOutput())
        return Future<[ResultListFood]?, RequestError> { promise in
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
