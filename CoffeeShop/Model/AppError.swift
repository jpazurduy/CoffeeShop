//
//  AppError.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/17/24.
//

import Foundation

enum AppError {
    case EmptyBasketError
    case NoUserError
}

extension AppError: CustomStringConvertible {
    public var description: String {
        switch self {
            case .EmptyBasketError:
                return "You have no items in your basket"
            case .NoUserError:
                return "Please login to place orders"
        }
    }
}
