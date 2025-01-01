//
//  LoginViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    // UI için kontrol değişkenleri
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    @Published var isLoginSuccessful: Bool = false


    
    init(authService: AuthService){
        self.authService = authService
    }
    
    func login(){
        
        //Doğrulama
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password cannot be empty."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        // Servis Çağrısı
        authService.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] user in
                guard self != nil else { return }
                if let token = user.token {
                    AuthManager.shared.saveToken(token) // Token'ı kaydet
                }
                self?.isLoginSuccessful = true // Başarılı Durumu
            }
            .store(in: &cancellables)
    }
    
}
