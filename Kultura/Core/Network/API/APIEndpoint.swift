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
        return APIEndpoint(
            url: "http://kultura-001-site1.ktempurl.com/api/auth/login", 
            method: "POST", 
            body: body
        )
    }
    
    static func signup(email: String, fullName: String, age: Int, password: String) -> APIEndpoint{
        let parameters = [
            "email": email,
            "fullName": fullName,
            "age": age,
            "password": password
        ] as [String : Any]
        
        let body = try? JSONSerialization.data(withJSONObject: parameters)
        return APIEndpoint(
            url: "http://kultura-001-site1.ktempurl.com/api/Auth/Register",
            method: "POST",
            body: body
        )
    }
    
}
