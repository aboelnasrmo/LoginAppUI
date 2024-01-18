//
//  SignInViewModel.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import Foundation


class SignInViewModel: ObservableObject {
    init(){
        
    }
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var errorMessage = ""

    func signIn() {
        print("email: \(email)")
        print("password: \(password)")

        // Basic validation
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password cannot be empty."
            return
        }

        // Dummy check for demonstration. Replace with actual authentication logic.
        if email == "M@m.com" && password == "12" {
            isAuthenticated = true
            errorMessage = ""
            
        } else {
            isAuthenticated = false
            errorMessage = "Invalid email or password."
        }
    }
}
