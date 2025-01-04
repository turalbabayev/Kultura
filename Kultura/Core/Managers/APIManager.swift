//
//  APIManager.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import Foundation
import Combine

final class APIManager {
    func performRequest<T: Decodable>(endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        //Convert API to URL
        guard let url = URL(string: endpoint.url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.httpBody = endpoint.body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = AuthManager.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap{data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
                
    }
    
    func makeAPIRequest() {
        // Kullanıcı adı ve şifre bilgileri
        let username = "11211127"
        let password = "60-dayfreetrial"

        // Kullanıcı adı ve şifreyi Basic Auth formatına dönüştürme
        let credentials = "\(username):\(password)"
        guard let credentialsData = credentials.data(using: .utf8) else {
            print("Failed to encode credentials")
            return
        }
        let encodedCredentials = credentialsData.base64EncodedString()

        // API URL'si
        let urlString = "http://kultura-001-site1.ktempurl.com/api/Restaurant/getRestaurantById/045285a9-44dd-43e5-845c-5803362d6296" // API'nizin URL'sini buraya yazın
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        // URLRequest oluşturma
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(encodedCredentials)", forHTTPHeaderField: "Authorization")

        // İsteği gönderme
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Hata kontrolü
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Yanıtı ve veriyi kontrol etme
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)") // HTTP durum kodunu yazdır
            }

            if let data = data {
                // Yanıtı JSON olarak çözme
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response JSON: \(jsonResponse)")
                } catch {
                    print("Failed to parse JSON: \(error.localizedDescription)")
                }
            }
        }

        // İsteği başlatma
        task.resume()
    }
}
