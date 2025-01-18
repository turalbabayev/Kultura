protocol AuthRepositoryProtocol {
    func login(email: String, password: String) -> AnyPublisher<User, Error>
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<User, Error>
}

class AuthRepository: AuthRepositoryProtocol {
    private let apiManager: APIManager
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func login(email: String, password: String) -> AnyPublisher<User, Error> {
        let endpoint = APIEndpoint.login(email: email, password: password)
        return apiManager.request(endpoint: endpoint)
    }
    
    func signup(email: String, fullName: String, age: Int, password: String) -> AnyPublisher<User, Error> {
        let endpoint = APIEndpoint.signup(email: email, fullName: fullName, age: age, password: password)
        return apiManager.request(endpoint: endpoint)
    }
} 