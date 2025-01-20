//
//  KulturaTests.swift
//  KulturaTests
//
//  Created by Tural Babayev on 9.12.2024.
//

import XCTest
@testable import Kultura
import Combine

final class APIManagerTests: XCTestCase {
    var sut: APIManager!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        sut = APIManager()
        cancellables = []
    }
    
    override func tearDown() {
        sut = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testPerformRequest_WithInvalidURL_ShouldReturnError() {
        // Given
        let expectation = expectation(description: "Should return bad URL error")
        let invalidEndpoint = MockEndpoint(url: "invalid url", method: "GET")
        
        // When
        let publisher: AnyPublisher<MockResponse, Error> = sut.performRequest(endpoint: invalidEndpoint)
        
        publisher.sink { completion in
            switch completion {
            case .failure(let error as URLError):
                XCTAssertEqual(error.code, .badURL)
                expectation.fulfill()
            case .finished:
                XCTFail("Expected error but got success")
            case .failure:
                XCTFail("Expected URLError but got different error")
            }
        } receiveValue: { _ in
            XCTFail("Expected error but got value")
        }
        .store(in: &cancellables)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}

// MARK: - Helper Types

struct MockEndpoint: APIEndpoint {
    var url: String
    var method: String
    var body: Data? = nil
}

struct MockResponse: Codable {
    let id: Int
    let name: String
}


