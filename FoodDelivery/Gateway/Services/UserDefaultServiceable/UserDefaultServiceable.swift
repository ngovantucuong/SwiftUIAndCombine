//
//  UserDefaultService.swift
//  Jinjer_Kindergarten
//
//  Created by cuongnvt on 11/23/20.
//

import UIKit

// MARK: Protocol
protocol UserDefaultServiceable {
    func getValue<T>(key: SaveKey) -> T?
    func setValue<T>(value: T, key: SaveKey)
}

// MARK: SaveKey
enum SaveKey: String {
    case email
    case password
}

class UserDefaultServiceImplement: UserDefaultServiceable {
    func getValue<T>(key: SaveKey) -> T? {
        if let value = UserDefaults.standard.object(forKey: key.rawValue) as? T {
            return value
        }
        return nil
    }
    func setValue<T>(value: T, key: SaveKey) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
}
