//
//  BaseAPIService.swift
//  BaseAPIService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case blankResponse
}

class BaseAPIService {
    private let baseURL:String = "https://run.mocky.io/v3/"
    func endpoint(_ endpoint:String) -> String{
        return "\(baseURL)\(endpoint)"
    }
    func get<T:Decodable>(url:String, expectedModel:T.Type) async throws -> T {
        try await withCheckedThrowingContinuation({ continuation in
            guard let url = URL(string: url) else {
                continuation.resume(throwing: APIServiceError.invalidURL)
                return
            }
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let data = data else {
                    continuation.resume(throwing: APIServiceError.blankResponse)
                    return
                }
                do {
                    let decodedResponse = try JSONDecoder().decode(expectedModel.self, from: data)
                    continuation.resume(returning: decodedResponse)
                } catch {
                    continuation.resume(throwing: error)
                }
            }.resume()
        })
    }
}
