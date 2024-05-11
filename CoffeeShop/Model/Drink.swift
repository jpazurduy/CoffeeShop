//
//  Drink.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import Foundation

enum Category: String, Codable, Hashable {
    case hot
    case cold
    case softDrinks
}

struct Drink: Codable, Identifiable {
    let id: String 
    let name: String
    let description: String
    let imageLink: String
    let price: Double
    let category: Category
    
    var imageUrl: URL? {
        URL(string: imageLink)
    }
}
