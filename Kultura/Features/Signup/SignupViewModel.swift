//
//  SignupViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import Foundation
import SwiftUI
import Combine

class SignupViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var age: String = ""
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
        // Validasyon kontrolleri
        guard !fullName.isEmpty, !email.isEmpty, !age.isEmpty, !password.isEmpty else {
            errorMessage = "Tüm alanları doldurunuz."
            return
        }
        
        guard password == passwordAgain else {
            errorMessage = "Şifreler eşleşmiyor."
            return
        }
        
        guard let ageInt = Int(age) else {
            errorMessage = "Geçerli bir yaş giriniz."
            return
        }
        
        // Email formatı kontrolü
        guard isValidEmail(email) else {
            errorMessage = "Geçerli bir email adresi giriniz."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        authService.signup(email: email, fullName: fullName, age: ageInt, password: password)
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
            }, receiveValue: { [weak self] (response: SignupResponse) in
                guard let self = self else { return }
                if response.success {
                    self.isSignupSuccessful = true
                } else {
                    self.errorMessage = response.errorMessage ?? "Kayıt işlemi başarısız"
                }
            })
            .store(in: &cancellables)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
