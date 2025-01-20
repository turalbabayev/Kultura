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
        // Uygulama başlatıldığında token'ları temizle
        AuthManager.shared.clearTokens()
        
        // Resolver DI Kayıtları
        registerDependencies()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Uygulama arka plana geçtiğinde token'ları temizle
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    AuthManager.shared.clearTokens()
                }
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
        
        Resolver.register {
            RestaurantService(repository: RestaurantRepository(apiManager: APIManager()))
        }
        .scope(.shared)
        
        Resolver.register {
            HomeViewModel(restaurantService: Resolver.resolve())
        }
    }
}
