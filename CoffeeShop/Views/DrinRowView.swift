//
//  DrinRowView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/12/24.
//

import SwiftUI

struct DrinRowView: View {
    // MARK: - PROPERTIES
    private let drink: Drink
    private var didClickRow: () -> Void
    // MARK: - FUNCTIONS
    
    init(drink: Drink, didClickRow: @escaping () -> Void) {
        self.drink = drink
        self.didClickRow = didClickRow
    }
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            didClickRow()
        }, label: {
            HStack {
                Rectangle()
                    .frame(width: 60, height: 60, alignment: .center)
                 
                VStack(alignment: .leading, spacing: 5) {
                
                    Text(drink.name)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text("\(drink.price, format: .currency(code: "EUR"))")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary )
                }
                .padding(.leading)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
        })
        .tint(.black)
        
    }
}

// MARK: - PREVIEW
struct DrinRowView_Previews: PreviewProvider {
    static var previews: some View {
        DrinRowView(drink: DummyData.drinks[0]) {
            print("a+b")
        }
    }
}
