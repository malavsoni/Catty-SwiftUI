//
//  CatFactsRepository.swift
//  CatFactsRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
protocol CatFactsRepositoryProtocol {
    func fetchFacts() async throws -> [CatFactEntity]
}

typealias CatFactsLocalDataSource = CatFactsService & SaveableService

class CatFactsRepository: CatFactsRepositoryProtocol {
    private let remoteDataSource:CatFactsService
    private let localDataSource:CatFactsLocalDataSource
    
    init(remoteDataSource:CatFactsService = CatFactsRemoteService(),
         localDataSource:CatFactsLocalDataSource = CatFactsLocalService()
    ){
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchFacts() async throws -> [CatFactEntity] {
        do {
            let users = try await self.localDataSource.fetchFacts()
            if users.isEmpty {
                let facts:[CatFactEntity] = try await self.remoteDataSource.fetchFacts()
                try await self.localDataSource.saveAll(entities: facts)
                return facts
            }
            return users
        } catch {
            return try await self.remoteDataSource.fetchFacts()
        }
    }
}
