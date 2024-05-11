//
//  Basket.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

struct Basket: Codable {
    let id: String
    let items: [Drink]
}
