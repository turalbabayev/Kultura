//
//  AuthRepository.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Combine

protocol AuthRepositoryProtocol {
    func login(email: String, password: String) -> AnyPublisher<User, Error>
    func signup(name: String, surname: String, email: String, password: String) -> AnyPublisher<User, Error>
}

final class AuthRepository: AuthRepositoryProtocol{
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func login(email: String, password: String) -> AnyPublisher<User, any Error> {
        let endpoint = APIEndpoint.login(email: email, password: password)
        return apiManager.performRequest(endpoint: endpoint)
    }
    
    func signup(name: String, surname: String, email: String, password: String) -> AnyPublisher<User, any Error> {
        let endpoint = APIEndpoint.signup(name: name, surname: surname, email: email, password: password)
        return apiManager.performRequest(endpoint: endpoint)
    }
}
