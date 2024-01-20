//
//  Animation.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 20/01/2024.
//

import SwiftUI
import RiveRuntime

struct Animation: View {
    var body: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            
    }
}

#Preview {
    Animation()
}
