//
//  OnboardingCoordinator.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

class OnboardingCoordinator: Coordinator{
    private let onFinish: () -> Void
    
    init(onFinish: @escaping () -> Void) {
        self.onFinish = onFinish
    }
    
    func start() -> AnyView {
        return AnyView(OnboardingView(onFinish: onFinish))
    }
}
