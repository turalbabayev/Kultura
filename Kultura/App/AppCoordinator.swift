//
//  AppCoordinator.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

class AppCoordinator: Coordinator{
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    func start() -> AnyView {
        if hasSeenOnboarding{
            print("Ana Sayfaya Yonlendirilecek")
            return AnyView(LoginCoordinator().start())
        }else{
            return AnyView(OnboardingCoordinator{ [weak self] in
                self?.completeOnboarding()
            }.start())
        }
    }
    
    private func completeOnboarding() {
        hasSeenOnboarding = true
    }
    
}
