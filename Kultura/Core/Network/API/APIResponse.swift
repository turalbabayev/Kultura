import Foundation

struct APIResponse<T: Codable>: Codable {
    let success: Bool
    let message: String?
    let errorMessage: String?
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case errorMessage
        case data
    }
} 