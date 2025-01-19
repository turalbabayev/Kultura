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
            print("API Response: \(responseString)")
        }
        
        let decoder = JSONDecoder()
        do {
            // Debug için tip bilgisini yazdıralım
            print("Trying to decode as type: \(T.self)")
            
            // Login ve Signup için özel kontroller
            if T.self == LoginResponse.self || T.self == SignupResponse.self {
                let response = try decoder.decode(T.self, from: data)
                return response
            }
            
            // RestaurantResponse için özel kontrol
            if T.self == RestaurantResponse.self {
                do {
                    let response = try decoder.decode(RestaurantResponse.self, from: data)
                    print("Successfully decoded RestaurantResponse")
                    print("Success: \(response.success)")
                    print("Message: \(response.message)")
                    print("Restaurant count: \(response.data.restaurants.count)")
                    return response as! T
                } catch {
                    print("RestaurantResponse decode error: \(error)")
                    throw error
                }
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
            print("Decoding Error Details: \(error)")
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .keyNotFound(let key, let context):
                    print("Key '\(key)' not found: \(context.debugDescription)")
                    print("Coding path: \(context.codingPath)")
                case .typeMismatch(let type, let context):
                    print("Type '\(type)' mismatch: \(context.debugDescription)")
                    print("Coding path: \(context.codingPath)")
                case .valueNotFound(let type, let context):
                    print("Value of type '\(type)' not found: \(context.debugDescription)")
                    print("Coding path: \(context.codingPath)")
                case .dataCorrupted(let context):
                    print("Data corrupted: \(context.debugDescription)")
                    print("Coding path: \(context.codingPath)")
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
        request.timeoutInterval = 30
        
        if let body = endpoint.body, let bodyString = String(data: body, encoding: .utf8) {
            print("Request Body: \(bodyString)")
        }
        
        if let token = AuthManager.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> T in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                print("Status Code: \(httpResponse.statusCode)")
                
                if !(200...299).contains(httpResponse.statusCode) {
                    throw APIError.serverError("Server error: \(httpResponse.statusCode)")
                }
                
                return try self.handleResponse(data)
            }
            .mapError { error -> Error in
                print("API Error: \(error)")
                if let apiError = error as? APIError {
                    return apiError
                }
                return APIError.networkError(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
