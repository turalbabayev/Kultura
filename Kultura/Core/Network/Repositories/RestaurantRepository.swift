import Foundation
import Combine

protocol RestaurantRepositoryProtocol {
    func getAllRestaurants() -> AnyPublisher<[APIRestaurant], Error>
    func getTop5Restaurants() -> AnyPublisher<[APIRestaurant], Error>
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
                return response.data.restaurants
            }
            .eraseToAnyPublisher()
    }
    
    func getTop5Restaurants() -> AnyPublisher<[APIRestaurant], Error> {
        let endpoint = APIEndpoint.getTop5Restaurants()
        return apiManager.performRequest(endpoint: endpoint)
            .map { (response: RestaurantResponse) -> [APIRestaurant] in
                return response.data.restaurants
            }
            .eraseToAnyPublisher()
    }
}
