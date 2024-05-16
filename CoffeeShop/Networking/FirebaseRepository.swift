//
//  FirebaseRepository.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

final class FirebaseRepository: Repository {
    func saveDrinks() async {
        for drink in DummyData.drinks {
            do {
                try await FirebaseFirestoreHelper.firebaseReference(.Drinks)
                    .addDocument(data: ["id" : drink.id,
                                        "name" : drink.name,
                                        "price" : drink.price,
                                        "imageUrl" : drink.imageUrl?.absoluteString,
                                        "description" : drink.description,
                                        "category" : drink.category])
            } catch {
                print("Error saving drink to Firebase")
            }
        }
    }
    
 
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
