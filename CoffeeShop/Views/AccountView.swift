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
    @EnvironmentObject var userRepository: UserRepository
    
    // MARK: - FUNCTIONS
    
    @ViewBuilder
    func logoutButton() -> some View {
        Button(action: {
            userRepository.removeUser()
            viewModel.setupUI(user: nil)
        }, label: {
            Text("Log out")
        })
    }
    
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
                        userRepository.saveChanges(name: viewModel.name,
                                                   address: viewModel.address, mobile: viewModel.mobile)
                    }, label: {
                        Text(userRepository.user != nil ? "Update user" : "Create User")
                    })
                }
                .disabled(viewModel.isInvalidForm())
            }
            .navigationTitle("🤭 My Account")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if userRepository.user != nil {
                        logoutButton()
                    }
                }
            }
            .onAppear {
                viewModel.setupUI(user: userRepository.user)
            }
        }
    }
}

// MARK: - PREVIEW
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
