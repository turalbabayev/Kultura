//
//  AuthService.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Combine

final class AuthService {
    private let repository: AuthRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, Error> {
        return repository.login(email: email, password: password)
            .handleEvents(receiveOutput: { [weak self] response in
                if response.success {
                    AuthManager.shared.saveTokens(
                        accessToken: response.accessToken,
                        refreshToken: response.refreshToken
                    )
                    self?.fetchAndSaveUserId()
                }
            })
            .eraseToAnyPublisher()
    }
    
    private func fetchAndSaveUserId() {
        repository.getUserId()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("UserId alınamadı: \(error)")
                }
            } receiveValue: { response in
                AuthManager.shared.saveUserId(response.userId)
            }
            .store(in: &cancellables)
    }
    
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<SignupResponse, Error> {
        return repository.signup(email: email, fullName: fullName, age: age, password: password)
            .eraseToAnyPublisher()
    }
}
