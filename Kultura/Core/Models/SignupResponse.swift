//
//  SignupResponse.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import Foundation

struct SignupResponse: Codable {
    let success: Bool
    let message: String
    let errorMessage: String?
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case errorMessage
        case id = "$id"
    }
} 