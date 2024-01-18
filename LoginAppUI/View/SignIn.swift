//
//  ContentView.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import SwiftUI

struct SignIn: View {
   @ObservedObject var viewModel = SignInViewModel()
   
    var body: some View {
        ZStack {
            Circle()
                          .foregroundColor(.red.opacity(0.2))
                          .offset(y:-180)
                          .frame(width: 900,height: 900)

            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 50)
                TextField("Email", text: $viewModel.email)
                
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                SecureField("Password", text: $viewModel.password
                    
                )
                    .foregroundColor(.blue)
                    
                    .padding()
                
                    .background(Color(.systemGray6))
                   
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                CustomButton(title: "Login") {
                    viewModel.signIn()
                    
                }
                .animation(.interactiveSpring, value: 0.5)

                .padding(.bottom, 20)
                HStack {
                    Text("Don't have an account?")
                        .font(.system(size: 14))
                    Button(action: {}, label: {
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.blue)
                    })
                }
                Spacer()
            }
            .padding()
            .frame(width: 400, height: 600)
            
            
            
           
            
           
        }
    }
}

#Preview {
    SignIn()
}
