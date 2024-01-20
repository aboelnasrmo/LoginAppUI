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
        
        // Regular expression pattern to validate email
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        if let range = email.range(of: emailRegex, options: .regularExpression), range.lowerBound == email.startIndex && range.upperBound == email.endIndex {
            // Email is valid
            if email == "M@m.com" && password == "12" {
                isAuthenticated = true
                errorMessage = ""
            } else {
                isAuthenticated = false
                errorMessage = "Invalid email or password."
            }
        } else {
            // Invalid email format
            errorMessage = "Invalid email format."
            isAuthenticated = false
        }
    }
}

