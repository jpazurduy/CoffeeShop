//
//  CoffeeShopApp.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import SwiftUI
import FirebaseCore

@main
struct CoffeeShopApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BasketViewModel(repository: FirebaseRepository()))
                .environmentObject(UserRepository())
        }
    }
}
