//
//  CustomButton.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                
                .background(.orange.opacity(0.9))
            
                .cornerRadius(15)
            
        })
    }
}

#Preview {
    CustomButton(title: "") {
        
    }
}
