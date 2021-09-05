//
//  MockCatFactsRepository.swift
//  MockCatFactsRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation 

class MockCatFactsRepository:CatFactsRepository {
    var expectedResult: [CatFact]
    init(expectedResult:[CatFact]) {
        self.expectedResult = expectedResult
        super.init(remoteDataSource: MockCatFactsService(expectedResult: expectedResult))
    }
}
