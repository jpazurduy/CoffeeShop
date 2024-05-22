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
                try await FirebaseFirestoreHelper.firebaseReference(.Drinks).addDocument(from: drink.self)
                    
            } catch {
                print("Error saving drink to Firebase")
            }
        }
    }
    
    func fetchDrinks() async -> [Drink] {
        var drinks: [Drink] = []
        do {
            let snapshot = try await FirebaseFirestoreHelper.firebaseReference(.Drinks).getDocuments()
            for document in snapshot.documents {
                let data = try JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted)
                let drink = try! JSONDecoder().decode(Drink.self, from: data)
                drinks.append(drink)
              }
            
        } catch {
            print("Error fetching data")
        }
        return drinks
    }
    
    func placeOrder(order: Order) async {
        do {
            try await FirebaseFirestoreHelper.firebaseReference(.Order).addDocument(from: order.self)
        } catch {
            print("Error adding order", error.localizedDescription)
        }
//        print("Place an order for: \(order.customerName)")
//        for item in order.items {
//            print(item.name)
//        }
    }
}
