//
//  User.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation

struct User: Codable {
    let id: String?
    let email: String
    let fullName: String
    let age: Int
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case fullName
        case age
        case token
    }
}
