//
//  LoginCoordinator.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

class LoginCoordinator: Coordinator{
    func start() -> AnyView {
        return AnyView(LoginView())
    }
}
