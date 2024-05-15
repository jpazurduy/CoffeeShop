//
//  CoffeeShopApp.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import SwiftUI

@main
struct CoffeeShopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BasketViewModel(repository: FirebaseRepository()))
                .environmentObject(UserRepository())
        }
    }
}
