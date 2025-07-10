//
//  NetworkManager.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int)
}

protocol NetworkService {
    func request<T: Decodable>(endpoint: String, type: T.Type) async throws -> T
}

class NetworkManager: NetworkService {
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable>(endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        print(data)
        print(response)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print(error)
            throw NetworkError.decodingError
        }
    }
    
}
