//
//  AcountViewModel.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/14/24.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var address: String = ""
    @Published var mobile: String = ""
    
    func setup(user: User) {
        self.name = user.name
        self.address = user.address
        self.mobile = user.mobile
    }
    
    func isInvalidForm() -> Bool {
        name.isEmpty || address.isEmpty || mobile.isEmpty
    }
}
