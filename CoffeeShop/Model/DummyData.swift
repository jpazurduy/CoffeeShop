//
//  DummyData.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import Foundation

struct DummyData {
    static let basket = Basket(id: UUID().uuidString, items: [])
    static let user = User(id: UUID().uuidString, name: "Jorge", address: "Arocagua Mayu Av.", mobile: "78880704")
    
    static let drinks: [Drink] = [
        Drink(id: UUID().uuidString,
             name: "Espresso",
             description: "Espresso is the purest distillation of the coffee bean. It doesn't refer to a bean or blend, but actually the preparation method. ",
             imageLink: "https://cdn.pixabay.com/photo/2015/05/07/13/46/cappuccino-756490_960_720.jpg",
             price: 2.50,
             category: Category.hot),

        Drink(id: UUID( ).uuidString,
                name: "Cappuccino",
            description: "Outside of Italy, cappuccino is a coffee drink that today is typically composed of double espresso and hot milk, with the surface topped with foamed milk. Cappuccinos are most often prepared with an espresso machine.",
            imageLink: "https://cdn.pixabay.com/photo/2018/10/11/21/34/cappucino-3740926_960_720.jpg",
            price: 2.50, category: Category.hot),


        Drink(id: UUID().uuidString,
            name: "Ice Latte", description: "The latte is one of the most iconic espresso drinks, favored for its frothy foam topping. In this refreshing iced version, you can easily create foam with cold milk-no steamer needed.",
            imageLink: "https://cdn.pixabay.com/photo/2014/11/21/15/20/coffee-540653_960_720.jpg",
            price: 3.50,
            category: Category.cold),
        
        Drink(id: UUID().uuidString,
            name: "Choco Latte", description: "The Choco Latte is one of the most iconic espresso drinks, favored for its frothy foam topping. In this refreshing iced version, you can easily create foam with cold milk-no steamer needed.",
            imageLink: "https://cdn.pixabay.com/photo/2014/11/21/15/20/coffee-540653_960_720.jpg",
            price: 4.00,
            category: Category.hot),
        
        Drink(id: UUID().uuidString,
            name: "Coffe Latte", description: "The Coffe Latte is one of the most iconic espresso drinks, favored for its frothy foam topping. In this refreshing iced version, you can easily create foam with cold milk-no steamer needed.",
            imageLink: "https://cdn.pixabay.com/photo/2014/11/21/15/20/coffee-540653_960_720.jpg",
            price: 3.50,
            category: Category.hot),
        
        Drink(id: UUID().uuidString,
            name: "Milk Latte", description: "The Coffe Latte is one of the most iconic espresso drinks, favored for its frothy foam topping. In this refreshing iced version, you can easily create foam with cold milk-no steamer needed.",
            imageLink: "https://cdn.pixabay.com/photo/2014/11/21/15/20/coffee-540653_960_720.jpg",
            price: 3.50,
              category: Category.softDrinks),
    ]
}
