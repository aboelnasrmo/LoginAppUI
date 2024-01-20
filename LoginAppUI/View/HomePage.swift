//
//  HomePage.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import SwiftUI
import RiveRuntime

struct HomePage: View {
    var body: some View {
        NavigationView {
            TabView(selection: .constant(1)) {
                
                HomeTab()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
                    .tag(1)
                
                SettingsTab()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(2)
            }
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    HomePage()
}
