//
//  User.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation

struct User: Codable {
    let id: Int?
    let name: String
    let surname: String
    let email: String
    let token: String?
    
    init(id: Int?, name: String, surname: String, email: String, token: String?) {
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
        self.token = token
    }
}
