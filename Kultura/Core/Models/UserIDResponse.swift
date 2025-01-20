//
//  UserIDResponse.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import Foundation

struct UserIDResponse: Codable {
    let id: String
    let userId: String
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case userId
    }
} 