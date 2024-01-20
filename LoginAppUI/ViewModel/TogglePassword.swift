//
//  TogglePassword.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 20/01/2024.
//

import Foundation
import SwiftUI

struct PasswordToggleStyle: TextFieldStyle {
    @Binding var password: String
    @Binding var isSecure: Bool

    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if isSecure {
                SecureField("", text: $password)
            } else {
                TextField("", text: $password)
            }
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
            }
        }
    }
}
