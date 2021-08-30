//
//  MockCatFactsRepository.swift
//  MockCatFactsRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
@testable import Catty

class MockCatFactsRepository:CatFactsRepository {
    var expectedResult: [CatFact]
    init(expectedResult:[CatFact]) {
        self.expectedResult = expectedResult
        super.init(remoteDataSource: MockCatFactsService(expectedResult: expectedResult))
    }
}
