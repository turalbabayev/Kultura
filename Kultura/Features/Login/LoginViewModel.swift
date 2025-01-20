//
//  LoginViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLoggedIn = false
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login() {
        isLoading = true
        errorMessage = nil
        
        // Önceki oturumu temizle
        AuthManager.shared.clearTokens()
        
        authService.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.handleError(error)
                }
            } receiveValue: { [weak self] response in
                self?.handleLoginResponse(response)
            }
            .store(in: &cancellables)
    }
    
    private func handleError(_ error: Error) {
        if let apiError = error as? APIError {
            switch apiError {
            case .serverError(let message):
                errorMessage = message
            default:
                errorMessage = "Bir hata oluştu. Lütfen tekrar deneyin."
            }
        } else {
            errorMessage = error.localizedDescription
        }
    }
    
    private func handleLoginResponse(_ response: LoginResponse) {
        if response.success {
            isLoggedIn = true
        } else {
            errorMessage = response.message
        }
    }
}

