//
//  DrinkDetailView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/12/24.
//

import SwiftUI

struct DrinkDetailView: View {
    // MARK: - PROPERTIES
    let drink: Drink
    @Binding var isShowingDetail: Bool
    
    // MARK: - FUNCTIONS
    
    @ViewBuilder
    private func addToBasketButton() -> some View {
        Button(action: {
            // 1 Add to basket
            // 2 Dismiss button
            isShowingDetail = false
        }, label: {
            Text("\(drink.price, format: .currency(code: "EUR")) - Add to Basket")
        })
        .buttonStyle(.borderedProminent)
        .padding(.bottom, 30)
    }
    
    @ViewBuilder
    private func dissmissButton() -> some View {
        Button(action: {
            isShowingDetail = false
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .scaleEffect(1.5)
                .padding()
                .foregroundColor(.gray)
        })
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            RemoteImageView(url: drink.imageUrl)
                .frame(width: 300, height: 225)
                .aspectRatio(contentMode: .fit)
            VStack {
                
                Text(drink.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(drink.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            
            Spacer()
            
            addToBasketButton()
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            dissmissButton()
        }
    }
}

// MARK: - PREVIEW
struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(drink: DummyData.drinks[0], isShowingDetail: .constant(true))
    }
}
