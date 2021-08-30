//
//  CatFactsRepository.swift
//  CatFactsRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
protocol CatFactsRepositoryProtocol {
    func fetchFacts(completion:@escaping (Result<[CatFact], Error>) -> Void) -> Void
}

class CatFactsRepository: CatFactsRepositoryProtocol {
    private let remoteDataSource:CatFactsServiceProtocol
    
    init(remoteDataSource:CatFactsServiceProtocol = CatFactsService()){
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchFacts(completion:@escaping (Result<[CatFact], Error>) -> Void) -> Void {
        self.remoteDataSource.fetchFacts(completion: completion)
    }
}
