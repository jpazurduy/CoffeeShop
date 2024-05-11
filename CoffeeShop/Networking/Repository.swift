//
//  Repository.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

protocol Repository {
    func fetchDrinks() async -> [Drink]
    func placeHolder(order: Order)
}
