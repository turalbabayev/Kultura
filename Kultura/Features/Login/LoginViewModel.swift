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
            errorMessage = "Email ve şifre boş olamaz."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        // Servis Çağrısı
        authService.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] (completion: Subscribers.Completion<Error>) in
                guard let self = self else { return }
                self.isLoading = false
                
                if case .failure(let error) = completion {
                    if let apiError = error as? APIError {
                        switch apiError {
                        case .serverError(let message):
                            self.errorMessage = message
                        default:
                            self.errorMessage = "Bir hata oluştu. Lütfen tekrar deneyin."
                        }
                    } else {
                        self.errorMessage = error.localizedDescription
                    }
                }
            }, receiveValue: { [weak self] (response: LoginResponse) in
                guard let self = self else { return }
                
                // Token'ları kaydet
                AuthManager.shared.saveToken(response.accessToken)
                AuthManager.shared.saveRefreshToken(response.refreshToken)
                
                // Login başarılı, TabBarView'a yönlendir
                self.isLoginSuccessful = true
            })
            .store(in: &cancellables)
    }
    
}
