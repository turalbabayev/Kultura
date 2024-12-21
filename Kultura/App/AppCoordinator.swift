//
//  AppCoordinator.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

import SwiftUI

class AppCoordinator: ObservableObject, Coordinator {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @Published private(set) var currentView: AnyView
    
    init() {
        self.currentView = AnyView(Text("Loading...")) // Geçici bir başlangıç değeri
        if hasSeenOnboarding {
            currentView = AnyView(LoginCoordinator().start())
        } else {
            currentView = AnyView(OnboardingCoordinator(
                onLogin: { [weak self] in
                    self?.navigateToLogin()
                },
                onSignup: { [weak self] in
                    self?.navigateToSignup()
                }
            ).start())
        }
    }
    
    func start() -> AnyView {
        return currentView
    }

    private func navigateToLogin() {
        hasSeenOnboarding = true
        currentView = AnyView(LoginCoordinator().start())
    }

    private func navigateToSignup() {
        hasSeenOnboarding = true
        currentView = AnyView(SignupCoordinator().start())
    }
}




