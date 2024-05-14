//
//  AccountView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/8/24.
//

import SwiftUI

struct AccountView: View {
    // MARK: - PROPERTIES
    
    @StateObject private var viewModel: AccountViewModel = AccountViewModel()
    
    // MARK: - FUNCTIONS
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $viewModel.name)
                    TextField("Address", text: $viewModel.address)
                    TextField("Mobile", text: $viewModel.mobile)
                }
                
                Section {
                    Button(action: {
                        
                    }, label: {
                        Text("Create User")
                    })
                }
                .disabled(viewModel.isInvalidForm())
            }
            .navigationTitle("🤭 My Account")
        }
    }
}

// MARK: - PREVIEW
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
