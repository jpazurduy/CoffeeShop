//
//  SecureStorrage.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/14/24.
//

import Foundation
import KeychainAccess

let userKey = "userSecureKey"

final class SecureStorage {
    private static let keychain = Keychain(service: "com.azurudy.CoffeeShop")
    
    func save(data: Data, with key: String) async {
        SecureStorage.keychain[data: key] = data
    }
    
    func get(with key: String) async -> Data? {
        let data = SecureStorage.keychain[data: key]
        return data
    }
    
    func delete(with key: String) async {
        SecureStorage.keychain[key] = nil
    }
}
