//
//  ContentView.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.red.opacity(0.7))
                .offset(y:-100)
                .frame(width: 900,height: 900)
            Circle()
                .foregroundColor(.red.opacity(0.6))
                .offset(y:-150)
                .frame(width: 900,height: 900)
            Circle()
                .foregroundColor(.red.opacity(0.5))
                .offset(y:-40)
                .frame(width: 900,height: 900)
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 50)
                TextField("Email", text: .constant(""))
                
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                SecureField("Password", text: .constant(""))
                   
                    .padding()
                
                    .background(Color(.systemGray6))
                   
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                Button(action: {}, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        
                        .background(.orange.opacity(0.9))
                    
                        .cornerRadius(15)
                    
                })
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
