//
//  ContentView.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color(.systemBlue))
                    .cornerRadius(15)
            })
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
