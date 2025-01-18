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
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<User, Error>
}

final class AuthRepository: AuthRepositoryProtocol{
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func login(email: String, password: String) -> AnyPublisher<User, any Error> {
        print("repository login")
        let endpoint = APIEndpoint.login(email: email, password: password)
        return apiManager.performRequest(endpoint: endpoint)
    }
    
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<User, any Error> {
        let endpoint = APIEndpoint.signup(email: email, fullName: fullName, age: age, password: password)
        return apiManager.performRequest(endpoint: endpoint)
    }
}
