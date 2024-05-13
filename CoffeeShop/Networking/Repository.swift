//
//  Repository.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

protocol Repository: ObservableObject {
    func fetchDrinks() async -> [Drink]
    func placeHolder(order: Order)
}
