//
//  ServiceFacade.swift
//  Jinjer_Kindergarten
//
//  Created by cuongnvt on 11/12/20.
//

import Swinject
import NeoNetworking

extension Container {
    static var `default` = Container()
}

class ServiceFacade {
    // MARK: Variable
    static let apiService: NeoNetworkProviable = NeoNetworkProvider(with: APINeoConfigable())
    static let userDefaultService: UserDefaultServiceable = UserDefaultServiceImplement()
    // MARK: Function
    static func registerDefaultService(application: UIApplication) {
        ServiceFacade.initializeService(application: application)
    }
    static func getService<T>(_ type: T.Type) -> T? {
        return Container.default.resolve(type)
    }
    static private func initializeService(application: UIApplication) {
        Container.default.register(NeoNetworkProviable.self) { (_) in
            return ServiceFacade.apiService
        }
        Container.default.register(UserDefaultServiceable.self) { (_) in
            return ServiceFacade.userDefaultService
        }
    }
}
