//
//  AuthRepository.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Combine


protocol AuthRepositoryProtocol {
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, Error>
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<SignupResponse, Error>
}

class AuthRepository: AuthRepositoryProtocol {
    private let apiManager: APIManager
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, Error> {
        let endpoint = APIEndpoint.login(email: email, password: password)
        return apiManager.performRequest(endpoint: endpoint)
    }
    
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<SignupResponse, Error> {
        let endpoint = APIEndpoint.signup(email: email, fullName: fullName, age: age, password: password)
        return apiManager.performRequest(endpoint: endpoint)
    }
} 
