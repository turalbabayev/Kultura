//
//  SignupViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isSignupSuccessful: Bool = false

    // Dependencies
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    // Constructor (Dependency Injection ile AuthService'i alıyoruz)
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func signup() {
        guard !name.isEmpty, !surname.isEmpty, !email.isEmpty, !password.isEmpty, password == passwordAgain else {
            errorMessage = "All fields are required."
            return
        }
        
        guard password == passwordAgain else {
            errorMessage = "Passwords do not match."
            return
        }
        
        // Loading Başlat
        isLoading = true
        errorMessage = nil
        
        // AuthService ile API çağrısı
        authService.signup(name: name, surname: surname, email: email, password: password)
            .receive(on: DispatchQueue.main) // Ana thread üzerinde işlem yapıyoruz
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false // Loading Durumu Durdur
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription // Hata Mesajı Gönder
                case .finished:
                    break
                }
            } receiveValue: { [weak self] user in
                guard let self = self else { return }
                if let token = user.token {
                    AuthManager.shared.saveToken(token) // Token'ı Kaydet
                }
                self.isSignupSuccessful = true // Başarılı Durumu
            }
            .store(in: &cancellables)
    }
}
