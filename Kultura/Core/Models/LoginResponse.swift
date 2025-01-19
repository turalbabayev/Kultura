//
//  LoginResponse 2.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let accessToken: String
    let refreshToken: String
    let message: String
    let id: String?  // Eğer API'den geliyorsa
    
    enum CodingKeys: String, CodingKey {
        case success
        case accessToken = "accsesToken"  // API'deki yazım hatası
        case refreshToken
        case message
        case id = "$id"  // API'den gelen özel id formatı
    }
} 
