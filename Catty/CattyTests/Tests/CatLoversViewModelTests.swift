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
    
    let expectedUsers:[UserEntity] = [
        UserEntity(name: "Malav Soni"),
        UserEntity(name: "Charles Brown")
    ]
    let expectedCatFact:[CatFactEntity] = [
        CatFactEntity(fact: "Mock"),
        CatFactEntity(fact: "Test"),
    ]
    
    override func setUpWithError() throws {
            // Given
        let userRepository = MockUserRepository(expectedResult: expectedUsers,isUserAuthenticated: false)
        let catFactsRepository = MockCatFactsRepository(expectedResult: expectedCatFact)
        self.viewModel = CatLoversViewModel(
            catsUseCase: CatsUseCase(
                userRepository: userRepository, catFactsRepository: catFactsRepository
            )
        )
    }
    
    func testFetchInfo()  throws {
        Task {
            // When
        await self.viewModel.getInformation()
        
            // Then
        XCTAssertTrue(viewModel.users.count == expectedUsers.count)
        XCTAssertTrue(viewModel.users.first?.name == expectedUsers.first?.name)
        XCTAssertTrue(viewModel.facts.count == expectedCatFact.count)
        XCTAssertTrue(viewModel.facts.first?.fact == expectedCatFact.first?.fact)
        }
    }
}
