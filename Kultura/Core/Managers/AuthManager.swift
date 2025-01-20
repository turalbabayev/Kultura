//
//  AuthManager.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Security
import Combine

final class AuthManager {
    static let shared = AuthManager()
    
    private let tokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"
    private let isLoggedInKey = "isLoggedIn"
    private let userIdKey = "userId"
    
    private init() {}
    
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: isLoggedInKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: isLoggedInKey)
        }
    }
    
    func saveTokens(accessToken: String, refreshToken: String) {
        UserDefaults.standard.set(accessToken, forKey: tokenKey)
        UserDefaults.standard.set(refreshToken, forKey: refreshTokenKey)
        isLoggedIn = true
    }
    
    func saveUserId(_ userId: String) {
        UserDefaults.standard.set(userId, forKey: userIdKey)
    }
    
    func getUserId() -> String? {
        guard isLoggedIn else { return nil }
        return UserDefaults.standard.string(forKey: userIdKey)
    }
    
    func getToken() -> String? {
        guard isLoggedIn else { return nil }
        return UserDefaults.standard.string(forKey: tokenKey)
    }
    
    func getRefreshToken() -> String? {
        guard isLoggedIn else { return nil }
        return UserDefaults.standard.string(forKey: refreshTokenKey)
    }
    
    func clearTokens() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        UserDefaults.standard.removeObject(forKey: refreshTokenKey)
        UserDefaults.standard.removeObject(forKey: isLoggedInKey)
        UserDefaults.standard.removeObject(forKey: userIdKey)
    }
    
    func logout() {
        clearTokens()
    }
}
