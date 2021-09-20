//
//  CatFactsService.swift
//  CatFactsService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
 
class CatFactsRemoteService:BaseAPIService, CatFactsService {
    private let get:String = "9e563b1d-2a9e-4116-a2f4-33f4f9da64d9"
    
    func fetchFacts() async throws -> [CatFactEntity] {
        try await self.get(url: endpoint(get))
    }
}
