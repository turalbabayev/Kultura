//
//  AuthManager.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Security

final class AuthManager {
    static let shared = AuthManager()
    private let tokenKey = "authToken"
    private let refreshTokenKey = "refreshToken"
    
    private init() {}
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func saveRefreshToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: refreshTokenKey)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }
    
    func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: refreshTokenKey)
    }
    
    func clearTokens() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        UserDefaults.standard.removeObject(forKey: refreshTokenKey)
    }
}
