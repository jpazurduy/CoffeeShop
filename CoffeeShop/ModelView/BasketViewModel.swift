//
//  BasketViewModel.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/13/24.
//

import Foundation

final class BasketViewModel: ObservableObject {
   
    
    @Published private(set) var items: [Drink] = []
    
    @Published var showError = false
    
    @Published var basketError: AppError?
    
    private let repository: any Repository
    
    init(repository: any Repository) {
        self.repository = repository
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
    
    func add(drink: Drink) {
        items.append(drink)
        print("We have items \(items.count) drinks in our basket.")
    }
    
    func deleteItem(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
    
    func createOrder(for user: User?) async {
        guard !items.isEmpty else {
            Task { @MainActor in
                basketError = .EmptyBasketError
                showError = true
            }
            
            return
        }
        
        guard let user = user else {
            Task { @MainActor in
                basketError = .NoUserError
                showError = true
            }
            return
        }
        
        let order = Order(id: UUID().uuidString,
                          customerName: user.name,
                          customerAddress: user.address,
                          customerPhone: user.mobile,
                          items: items,
                          totalValue: totalPrice)
        
        await repository.placeOrder(order: order)
        items = []
    }
}
