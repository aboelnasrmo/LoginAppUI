//
//  SignInViewModel.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        print("email: \(email)")
        print("password: \(password)")
        
    }
    
    
}
