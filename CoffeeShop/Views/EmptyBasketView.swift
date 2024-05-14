//
//  EmptyBasketView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/14/24.
//

import SwiftUI

struct EmptyBasketView: View {
    // MARK: - PROPERTIES
    private let message: String
    
    // MARK: - FUNCTIONS
    init(message: String) {
        self.message = message
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "list.bullet.clipboard")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.gray, .red, .green)
                    .font(.system(size: 120))
                
                Text(message)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

// MARK: - PREVIEW
struct EmptyBasketView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBasketView(message: "Empty basket")
    }
}
