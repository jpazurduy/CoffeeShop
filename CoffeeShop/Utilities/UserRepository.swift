//
//  UserRepository.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/14/24.
//

import Foundation

final class UserRepository: ObservableObject {
    private let secureStorage: SecureStorage = SecureStorage()
    
    @Published var user: User?
    
    init(user: User? = nil) {
        Task {
            self.user = await fetchUser()
        }
    }
    
    func saveChanges(name: String, address: String, mobile: String) {
        if user != nil {
            updateUser(name: name, address: address, mobile: mobile)
        } else {
            createUser(name: name, address: address, mobile: mobile)
        }
    }
    
    private func createUser(name: String, address: String, mobile: String) {
        do {
            user = User(id: UUID().uuidString, name: name, address: address, mobile: mobile)
            
            let userData = try JSONEncoder().encode(user)
            
            Task {
                await secureStorage.save(data: userData, with: userKey)
            }
        } catch {
            print("Error, could't save user")
        }
    }
    
    private func updateUser(name: String, address: String, mobile: String) {
        do {
            user?.name = name
            user?.address = address
            user?.mobile = mobile
            
            let userData = try JSONEncoder().encode(user)
            
            Task {
                await secureStorage.save(data: userData, with: userKey)
            }
        } catch {
            print("Error, could't save user")
        }
    }
    
    
    
    func fetchUser() async -> User? {
        guard let userData = await secureStorage.get(with: userKey) else { return nil }
        
        do {
            return try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print("Error decoding user data")
            
        }
        return nil
    }
    
    @MainActor
    func removeUser() {
        Task {
            await secureStorage.delete(with: userKey)
            user = nil
        }
    }
}
