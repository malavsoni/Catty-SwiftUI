//
//  CatFactsLocalService.swift
//  CatFactsLocalService
//
//  Created by Malav Soni on 15/09/21.
//

import Foundation

class CatFactsLocalService:BaseLocalService, CatFactsService {
    private let get:String = "9e563b1d-2a9e-4116-a2f4-33f4f9da64d9"
    
    func fetchFacts() async throws -> [CatFactEntity] {
        let facts:[CatFact] = try await self.fetchAll()
        return facts.map{ CatFactEntity(model: $0) }
    }
}
