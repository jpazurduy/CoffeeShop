//
//  HomeViewModel.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    private let repository: Repository
    
    @Published private(set) var drinks: [Drink] = []
    @Published private(set) var selectedDrink: Drink?
    
    init(repository: FirebaseRepository, drinks: [Drink] = [], selectedDrink: Drink? = nil) {
        self.repository = repository
        self.drinks = drinks
        self.selectedDrink = selectedDrink
    }
    
    func fetchDrink() async {
        do {
            drinks = try await repository.fetchDrinks()
        } catch {
            print("Error fetching drinks", error.localizedDescription)
        }
    }
    
    func selectedDrink(drink: Drink) {
        self.selectedDrink = drink
    }
}
