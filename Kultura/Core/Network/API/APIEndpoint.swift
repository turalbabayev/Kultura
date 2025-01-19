//
//  APIEndpoint.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation

struct APIEndpoint {
    private let baseURL = "http://kultura-001-site1.ktempurl.com/api"
    let path: String
    let method: String
    let body: Data?
    
    var url: String {
        return baseURL + path
    }
    
    private init(path: String, method: String, body: Data? = nil) {
        self.path = path
        self.method = method
        self.body = body
    }
    
    static func login(email: String, password: String) -> APIEndpoint {
        let parameters = ["email": email, "password": password]
        let body = try? JSONSerialization.data(withJSONObject: parameters)
        return APIEndpoint(
            path: "/Auth/Login",
            method: "POST",
            body: body
        )
    }
    
    static func signup(email: String, fullName: String, age: Int, password: String) -> APIEndpoint {
        let parameters = [
            "email": email,
            "fullName": fullName,
            "age": age,
            "password": password
        ] as [String : Any]
        
        let body = try? JSONSerialization.data(withJSONObject: parameters)
        return APIEndpoint(
            path: "/Auth/Register",
            method: "POST",
            body: body
        )
    }
    
    static func getAllRestaurants() -> APIEndpoint {
        return APIEndpoint(
            path: "/User/getAll-Restaurants",
            method: "GET"
        )
    }
}
