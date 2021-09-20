//
//  FakeUserRepository.swift
//  FakeUserRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation 

class MockUserRepository:UserRepository, MockResult {
    var expectedResult: [UserEntity]
    let authenticationStatus:Bool
    init(expectedResult:[UserEntity], isUserAuthenticated:Bool = true) {
        self.authenticationStatus = isUserAuthenticated
        self.expectedResult = expectedResult
        super.init(remoteDataSource: MockUserService(expectedResult: expectedResult))
    }
    
    override func isUserAuthenticated() -> Bool {
        self.authenticationStatus
    }
    
    override func fetchUser() async throws -> [UserEntity] {
        return expectedResult
    }
}
