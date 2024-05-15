//
//  FirebaseRepository.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

final class FirebaseRepository: Repository {
 
    func fetchDrinks() async -> [Drink] {
        DummyData.drinks
    }
    
    func placeHolder(order: Order) {
        print("Place an order for: \(order.customerName)")
        for item in order.items {
            print(item.name)
        }
    }
}
