//
//  BasketView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import SwiftUI

struct BasketView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var basket: BasketViewModel
    @EnvironmentObject var userRepository: UserRepository
    
    // MARK: - FUNCTIONS
    @ViewBuilder
    func placeOrderButton() -> some View {
        Button(action: {
            basket.createOrder(for: userRepository.user)
        }, label: {
            Text("\(basket.totalPrice, format: .currency(code: "EUR")) - Place Order")
        })
        .buttonStyle(.borderedProminent)
        .padding(.bottom, 30)
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(basket.items) { drink in
                             DrinkRowView(drink: drink, didClickRow: {})
                        }
                        .onDelete(perform: basket.deleteItem)
                    }
                    .listStyle(.grouped)
                    .safeAreaInset(edge: .bottom) {
                        placeOrderButton()
                    }
                }
                if basket.items.isEmpty {
                    EmptyBasketView(message: "You have no items in your basket please add some")
                }
            }
            .navigationTitle("🛒 Basket")
        }
    }
}

// MARK: - PREVIEW
struct BasketView_Previews: PreviewProvider {
    static let repository = BasketViewModel(repository: FirebaseRepository())
    static var previews: some View {
        BasketView()
            .environmentObject(repository)
    }
}
