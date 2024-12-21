//
//  OnboardingCoordinator.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

class OnboardingCoordinator: Coordinator {
    private let onLogin: () -> Void
    private let onSignup: () -> Void

    init(onLogin: @escaping () -> Void, onSignup: @escaping () -> Void) {
        self.onLogin = onLogin
        self.onSignup = onSignup
    }

    func start() -> AnyView {
        return AnyView(OnboardingView(onLogin: onLogin, onSignup: onSignup))
    }
}


