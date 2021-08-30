//
//  MockCatFactsService.swift
//  MockCatFactsService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

class MockCatFactsService:CatFactsService {
    var expectedResult:[CatFact]
    init(expectedResult:[CatFact]) {
        self.expectedResult = expectedResult
        super.init()
    }
    override func fetchFacts() async throws -> [CatFact] {
        return expectedResult
    }
}
