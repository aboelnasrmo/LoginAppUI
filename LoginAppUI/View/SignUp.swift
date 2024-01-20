//
//  SignUp.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 20/01/2024.
//import SwiftUI
import SwiftUI


struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isRegistered = false
    @State private var errorMessage = ""
    @State private var isPasswordSecure = true // To toggle password visibility

    // Regular expression pattern for email validation
    let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

    // Regular expression patterns for password validation
    let uppercaseRegex = ".*[A-Z]+.*"
    let lowercaseRegex = ".*[a-z]+.*"
    let digitRegex = ".*\\d+.*"
    let symbolRegex = ".*[@$!%*?&]+.*"
    let minimumLengthRegex = ".{8,}" // Minimum 8 characters
    var passwordRegex: String {
        return "^(?=\(uppercaseRegex))(?=\(lowercaseRegex))(?=\(digitRegex))(?=\(symbolRegex))\(minimumLengthRegex)[A-Za-z\\d@$!%*?&]+$"
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.headline)
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    if !email.isEmpty {
                        Text(EmailValidator.isValidEmail(email) ? "Valid email" : "Invalid email")
                            .foregroundColor(EmailValidator.isValidEmail(email) ? .green : .red)
                    }
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.headline)
                    TextField("Password", text: $password)
                        .textFieldStyle(PasswordToggleStyle(password: $password, isSecure: $isPasswordSecure))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    Text("Password must contain:")
                        .font(.subheadline)
                  
                        Text("At least one uppercase letter")
                            .foregroundColor(password.range(of: uppercaseRegex, options: .regularExpression) != nil ? .green : .red)
                            .font(.subheadline)
                            .overlay(Rectangle().stroke(password.range(of: uppercaseRegex, options: .regularExpression) != nil ? Color.green : Color.clear, lineWidth: 1))
                        Text("At least one lowercase letter")
                            .foregroundColor(password.range(of: lowercaseRegex, options: .regularExpression) != nil ? .green : .red)
                            .font(.subheadline)
                            .overlay(Rectangle().stroke(password.range(of: lowercaseRegex, options: .regularExpression) != nil ? Color.green : Color.clear, lineWidth: 1))
                        Text("At least one digit")
                            .foregroundColor(password.range(of: digitRegex, options: .regularExpression) != nil ? .green : .red)
                            .font(.subheadline)
                            .overlay(Rectangle().stroke(password.range(of: digitRegex, options: .regularExpression) != nil ? Color.green : Color.clear, lineWidth: 1))
                        Text("At least one symbol (@$!%*?&)")
                            .foregroundColor(password.range(of: symbolRegex, options: .regularExpression) != nil ? .green : .red)
                            .font(.subheadline)
                            .overlay(Rectangle().stroke(password.range(of: symbolRegex, options: .regularExpression) != nil ? Color.green : Color.clear, lineWidth: 1))
                        Text("Minimum 8 characters")
                            .foregroundColor(password.range(of: minimumLengthRegex, options: .regularExpression) != nil ? .green : .red)
                            .font(.subheadline)
                            .overlay(Rectangle().stroke(password.range(of: minimumLengthRegex, options: .regularExpression) != nil ? Color.green : Color.clear, lineWidth: 1))
                    
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Confirm Password")
                        .font(.headline)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    if !confirmPassword.isEmpty {
                        Text(passwordsMatch() ? "Passwords match" : "Passwords do not match")
                            .foregroundColor(passwordsMatch() ? .green : .red)
                    }
                }

                Button(action: signUp) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $isRegistered) {
                    HomePage()
                }
                .padding(.bottom, 20)

                if isRegistered {
                    Text("Registration successful!")
                        .font(.headline)
                        .foregroundColor(.green)
                }

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Sign Up", displayMode: .inline)
        }
    }

    private func signUp() {
        if EmailValidator.isValidEmail(email) {
            if passwordsMatch() {
                if password.range(of: passwordRegex, options: .regularExpression) != nil {
                    // Successful registration logic here
                    isRegistered = true
                    errorMessage = ""
                }
            } else {
                // Passwords do not match error handling
                isRegistered = false
                errorMessage = "Passwords do not match."
            }
        } else {
            // Invalid email format
            isRegistered = false
            errorMessage = "Invalid email format."
        }
    }

    private func passwordsMatch() -> Bool {
        return password == confirmPassword
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

struct EmailValidator {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return email.range(of: emailRegex, options: .regularExpression) != nil
    }
}
