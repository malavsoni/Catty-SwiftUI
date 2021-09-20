//
//  MockCatFactsService.swift
//  MockCatFactsService
//
//  Created by Malav Soni on 30/08/21.
//

import Foundation

class MockCatFactsService:CatFactsRemoteService {
    var expectedResult:[CatFactEntity]
    init(expectedResult:[CatFactEntity]) {
        self.expectedResult = expectedResult
        super.init()
    }
    
    override func fetchFacts() async throws -> [CatFactEntity] {
        expectedResult
    }
}
