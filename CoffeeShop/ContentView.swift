//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            BasketView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Bag")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
    }
}

#Preview {
    ContentView()
}
