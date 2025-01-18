//
//  APIManager.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Combine

final class APIManager {
    // Generic response handler ekleyelim
    private func handleResponse<T: Codable>(_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(APIResponse<T>.self, from: data)
            guard response.success else {
                throw APIError.serverError(response.errorMessage ?? "Unknown error")
            }
            if let responseData = response.data {
                return responseData
            }
            throw APIError.decodingError
        } catch {
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
        
        if let token = AuthManager.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> T in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                
                if !(200...299).contains(httpResponse.statusCode) {
                    throw APIError.serverError("Server error: \(httpResponse.statusCode)")
                }
                
                return try self.handleResponse(data)
            }
            .mapError { error -> Error in
                if let apiError = error as? APIError {
                    return apiError
                }
                return APIError.networkError(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
