//
//  MockCatFactsService.swift
//  MockCatFactsService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
@testable import Catty

class MockCatFactsService:CatFactsService {
    var expectedResult:[CatFact]
    init(expectedResult:[CatFact]) {
        self.expectedResult = expectedResult
        super.init()
    }
    override func fetchFacts(completion: @escaping (Result<[CatFact], Error>) -> Void) {
        completion(.success(expectedResult))
    }
}
