//
//  CatFactsRepository.swift
//  CatFactsRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
protocol CatFactsRepositoryProtocol {
    func fetchFacts() async throws -> [CatFact]
}

class CatFactsRepository: CatFactsRepositoryProtocol {
    private let remoteDataSource:CatFactsServiceProtocol
    
    init(remoteDataSource:CatFactsServiceProtocol = CatFactsService()){
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchFacts() async throws -> [CatFact] {
        return try await self.remoteDataSource.fetchFacts()
    }
}
