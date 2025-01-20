struct LoginResponse: Codable {
    let id: String
    let success: Bool
    let message: String
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case success, message
        case accessToken, refreshToken
    }
}

struct LoginData: Codable {
    let accessToken: String
    let refreshToken: String
}

struct SignupResponse: Codable {
    let id: String
    let success: Bool
    let message: String
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case success, message, errorMessage
    }
} 