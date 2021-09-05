    //
    //  CatsUseCaseTests.swift
    //  CatsUseCaseTests
    //
    //  Created by Malav Soni on 05/09/21.
    //

import XCTest
@testable import Catty

class CatsUseCaseTests: XCTestCase {
    
    let expectedUsers:[User] = [
        User(name: "Malav Soni"),
        User(name: "Charles Brown")
    ]
    let expectedCatFact:[CatFact] = [
        CatFact(fact: "Mock"),
        CatFact(fact: "Test"),
    ]
    
    override func setUpWithError() throws {
            // Given
        
    }
    
    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPositive() async throws {
        do {
            // Given
            let userRepository = MockUserRepository(expectedResult: expectedUsers,isUserAuthenticated: true)
            let catFactsRepository = MockCatFactsRepository(expectedResult: expectedCatFact)
            let usecase = CatsUseCase(userRepository: userRepository, catFactsRepository: catFactsRepository)
            
            // When
            let users:[User] = try await usecase.fetchUser()
            let facts:[CatFact] = try await usecase.fetchFacts()
            
            // Then
            XCTAssert(users.count == expectedUsers.count)
            XCTAssert(facts.count == expectedCatFact.count)
        } catch  {
            
        }
    }
    
    func testNegative() async throws {
        do {
            // Given
            let userRepository = MockUserRepository(expectedResult: expectedUsers,isUserAuthenticated: false)
            let catFactsRepository = MockCatFactsRepository(expectedResult: expectedCatFact)
            let usecase = CatsUseCase(userRepository: userRepository, catFactsRepository: catFactsRepository)
            
            // When
            try await usecase.fetchUser()
        } catch let error {
            // Then
            switch error {
                case CatsUseCaseError.userAuthorizationFailed:
                    break
                default:
                    XCTFail("Error should be \(CatsUseCaseError.userAuthorizationFailed)")
            }
        }
    }
    
    func testPerformanceExample() throws {
            // This is an example of a performance test case.
        self.measure {
                // Put the code you want to measure the time of here.
        }
    }
    
}
