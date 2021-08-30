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
    func get<T:Decodable>(url:String, expectedModel:T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(APIServiceError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIServiceError.blankResponse))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(expectedModel.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
