static func getTop5Restaurants() -> APIEndpoint {
    return APIEndpoint(
        path: "/api/User/getTop5-ForRaitingRestaurants",
        method: "GET"
    )
}

static func getUserId() -> APIEndpoint {
    return APIEndpoint(
        path: "/api/User/getId",
        method: "GET"
    )
} 