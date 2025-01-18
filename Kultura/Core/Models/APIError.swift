//
//  APIError.swift
//  Kultura
//
//  Created by Tural Babayev on 18.01.2025.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case serverError(String)
    case decodingError
    case networkError(Error)
}
