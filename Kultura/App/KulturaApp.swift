//
//  KulturaApp.swift
//  Kultura
//
//  Created by Tural Babayev on 9.12.2024.
//

import SwiftUI
import Resolver

@main
struct KulturaApp: App {
    init() {
        // Resolver DI Kayıtları
        registerDependencies()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    private func registerDependencies() {
        // SignupViewModel için AuthService bağımlılığını kaydediyoruz
        Resolver.register {
            AuthService(repository: AuthRepository(apiManager: APIManager()))
        }
        .scope(.shared) // Tek bir instance paylaşılır
        
        Resolver.register {
            SignupViewModel(authService: Resolver.resolve())
        }
        
        Resolver.register{
            LoginViewModel(authService: Resolver.resolve())
        }
    }
}
