//
//  LoginAppUIApp.swift
//  LoginAppUI
//
//  Created by Mohammad Aboelnasr on 18/01/2024.
//

import SwiftUI

@main
struct LoginAppUIApp: App {
    @StateObject var viewModel = SignInViewModel()
    var body: some Scene {
        WindowGroup {
            if(viewModel.isAuthenticated){
                HomePage()
            }else{
                SignIn()
            }
        }
    }
}
