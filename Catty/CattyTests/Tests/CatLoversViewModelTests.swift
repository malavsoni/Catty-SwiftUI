//
//  CatLoversViewModelTests.swift
//  CatLoversViewModelTests
//
//  Created by Malav Soni on 29/08/21.
//

import XCTest
@testable import Catty
 
class CatLoversViewModelTests: XCTestCase {
    
    var viewModel:CatLoversViewModel!
    
    let expectedUsers:[User] = [
        User(id: 0, name: "Malav Soni"),
        User(id: 1, name: "Charles Brown")
    ]
    let expectedCatFact:[CatFact] = [
        CatFact(fact: "Mock", length: 4),
        CatFact(fact: "Test", length: 4),
    ]
    
    override func setUpWithError() throws {
        // Given
        let userRepository = MockUserRepository(expectedResult: expectedUsers)
        let catFactsRepository = MockCatFactsRepository(expectedResult: expectedCatFact)
        self.viewModel = CatLoversViewModel(
            userRepository: userRepository,
            catFactsRepository: catFactsRepository
        )
    }

    @MainActor func testFetchInfo() throws {
        Task {
            // When
            viewModel.fetchInfo()
            // Then
            XCTAssertTrue(viewModel.users.count == expectedUsers.count)
            XCTAssertTrue(viewModel.users.first?.name == expectedUsers.first?.name)
            XCTAssertTrue(viewModel.facts.count == expectedCatFact.count)
            XCTAssertTrue(viewModel.facts.first?.fact == expectedCatFact.first?.fact)
        }
    }
}
