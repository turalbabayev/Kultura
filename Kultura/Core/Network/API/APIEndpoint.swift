//
//  APIEndpoint.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation

struct APIEndpoint{
    let url: String
    let method: String
    let body: Data?
    
    static func login(email: String, password: String) -> APIEndpoint{
        let parameters = ["email": email, "password": password]
        let body = try? JSONSerialization.data(withJSONObject: parameters)
        return APIEndpoint(url: "https://api.kultura.com/login", method: "POST", body: body)
    }
    
    static func signup(name: String, surname: String, email: String, password: String) -> APIEndpoint{
        let parameters = [
            "name": name,
            "surname": surname,
            "email": email,
            "password": password
        ]
        let body = try? JSONSerialization.data(withJSONObject: parameters)
        return APIEndpoint(url: "https://api.kultura.com/signup", method: "POST", body: body)
    }
    
}
