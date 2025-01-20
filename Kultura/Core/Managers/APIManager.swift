//
//  APIManager.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Combine

final class APIManager {
    
    private func handleResponse<T: Codable>(_ data: Data) throws -> T {
        if let responseString = String(data: data, encoding: .utf8) {
            //print("API Response Data: \(responseString)")
        }
        
        let decoder = JSONDecoder()
        do {
            // UserIDResponse için özel kontrol
            if T.self == UserIDResponse.self {
                return try decoder.decode(T.self, from: data)
            }
            
            // Login ve Signup için özel kontroller
            if T.self == LoginResponse.self || T.self == SignupResponse.self {
                return try decoder.decode(T.self, from: data)
            }
            
            // RestaurantResponse için özel kontrol
            if T.self == RestaurantResponse.self {
                return try decoder.decode(RestaurantResponse.self, from: data) as! T
            }
            
            // Diğer response'lar için generic handling
            let response = try decoder.decode(APIResponse<T>.self, from: data)
            guard response.success else {
                throw APIError.serverError(response.errorMessage ?? "Unknown error")
            }
            if let responseData = response.data {
                return responseData
            }
            throw APIError.decodingError
        } catch {
            print("Decoding Error: \(error)")
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .keyNotFound(let key, let context):
                    print("Key '\(key)' not found: \(context.debugDescription)")
                case .typeMismatch(let type, let context):
                    print("Type '\(type)' mismatch: \(context.debugDescription)")
                case .valueNotFound(let type, let context):
                    print("Value of type '\(type)' not found: \(context.debugDescription)")
                case .dataCorrupted(let context):
                    print("Data corrupted: \(context.debugDescription)")
                @unknown default:
                    print("Unknown decoding error")
                }
            }
            throw APIError.decodingError
        }
    }
    
    func performRequest<T: Codable>(endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        guard let url = URL(string: endpoint.url) else {
            return Fail(error: APIError.invalidResponse).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.httpBody = endpoint.body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = AuthManager.shared.getToken() {
            print("Token being sent: \(token)") // Debug için
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            print("No token found") // Debug için
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> T in
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status Code: \(httpResponse.statusCode)") // HTTP status
                    if let responseString = String(data: data, encoding: .utf8) {
                        //print("Response Data: \(responseString)") // Response body
                    }
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                if !(200...299).contains(httpResponse.statusCode) {
                    throw APIError.serverError("Server error: \(httpResponse.statusCode)")
                }
                
                return try self.handleResponse(data)
            }
            .mapError { error -> Error in
                print("Network Error: \(error)") // Network error
                if let apiError = error as? APIError {
                    return apiError
                }
                return APIError.networkError(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
