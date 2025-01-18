import Foundation

enum APIError: Error {
    case invalidResponse
    case serverError(String)
    case decodingError
    case networkError(Error)
} 