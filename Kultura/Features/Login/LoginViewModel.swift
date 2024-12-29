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
    @Published var errorMessage: String? = nil
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService){
        self.authService = authService
    }
    
    func login(){
        authService.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion{
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue:{user in
                if let token = user.token{
                    AuthManager.shared.saveToken(token)
                }
            })
            .store(in: &cancellables)
    }
    
}
