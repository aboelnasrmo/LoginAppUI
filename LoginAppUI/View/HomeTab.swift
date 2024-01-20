//
//  HomeTab.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 20/01/2024.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        
        VStack {
            Text("Top Text in VStack")
                .padding()
            
            HStack {
                Text("Left")
                Text("Center")
                Text("Right")
            }
            .padding()
            
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                Text("ZStack")
            }
            
            Spacer()
        }
        
        
        
    }
}

#Preview {
    HomeTab()
}
