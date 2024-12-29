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
    
    init(repository: AuthRepositoryProtocol = AuthRepository()) {
        self.repository = repository
    }
    
    func login(email: String, password: String) -> AnyPublisher<User, Error> {
        return repository.login(email: email, password: password)
    }
    
    func signup(name: String, surname: String, email: String, password: String) -> AnyPublisher<User, Error> {
        return repository.signup(name: name, surname: surname, email: email, password: password)
    }
}
