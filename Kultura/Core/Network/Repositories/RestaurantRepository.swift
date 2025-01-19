import Foundation
import Combine

protocol RestaurantRepositoryProtocol {
    func getAllRestaurants() -> AnyPublisher<[APIRestaurant], Error>
}

class RestaurantRepository: RestaurantRepositoryProtocol {
    private let apiManager: APIManager
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func getAllRestaurants() -> AnyPublisher<[APIRestaurant], Error> {
        let endpoint = APIEndpoint.getAllRestaurants()
        return apiManager.performRequest(endpoint: endpoint)
            .map { (response: RestaurantResponse) -> [APIRestaurant] in
                print("Response success: \(response.success)")
                print("Response message: \(response.message)")
                print("Response data count: \(response.data.restaurants.count)")
                return response.data.restaurants
            }
            .eraseToAnyPublisher()
    }
}
