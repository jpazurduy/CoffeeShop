//
//  HomeView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import SwiftUI
struct HomeView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = HomeViewModel(repository: FirebaseRepository())
    @State private var isShowingDetail: Bool = false
    
    var categories: [String: [Drink]] {
        .init(grouping: viewModel.drinks, by: { $0.category.rawValue })
    }
    
    // MARK: - FUNCTIONS
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            NavigationStack {
                List(categories.keys.sorted(), id: \String.self) { key in
                    Section {
                        if let drinks = categories[key] {
                            ForEach(drinks) { drink in
                                DrinRowView(drink: drink) {
                                    viewModel.selectedDrink(drink: drink)
                                    self.isShowingDetail = true
                                }
                            }
                        }
                    } header: {
                        Text(key)
                            .font(.subheadline)
                    }

                }
                .navigationTitle("☕️ Home")
                .task {
                    await viewModel.fetchDrink()
                }
                .blur(radius: isShowingDetail ? 20 : 0)
                .disabled(isShowingDetail)
            }
            
            if isShowingDetail {
                Text("This is detail view")
            }
        }
    }
}

// MARK: - PREVIEW
struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
