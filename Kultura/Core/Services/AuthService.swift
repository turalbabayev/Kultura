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
        print("auth service login")
        return repository.login(email: email, password: password)
    }
    
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<User, Error> {
        return repository.signup(email: email, fullName: fullName, age: age, password: password)
    }
}
