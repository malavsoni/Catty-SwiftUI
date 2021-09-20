//
//  MockCatFactsRepository.swift
//  MockCatFactsRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation 

class MockCatFactsRepository:CatFactsRepository {
    var expectedResult: [CatFactEntity]
    init(expectedResult:[CatFactEntity]) {
        self.expectedResult = expectedResult
        super.init(remoteDataSource: MockCatFactsService(expectedResult: expectedResult))
    }
    
    override func fetchFacts() async throws -> [CatFactEntity] {
        expectedResult
    }
}
