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
    
    // MARK: - FUNCTIONS
    @ViewBuilder
    func placeOrderButton() -> some View {
        Button(action: {
            
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
                    Text("Empty basket")
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
