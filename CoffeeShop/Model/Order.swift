//
//  Order.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/9/24.
//

import Foundation

struct Order: Codable {
    let id: String
    let customerName: String
    let customerAddress: String
    let customerPhone: String
    let items: [Drink]
    let totalValue: Double
}
