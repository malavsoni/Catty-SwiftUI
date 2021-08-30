//
//  FakeUserRepository.swift
//  FakeUserRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation 

class MockUserRepository:UserRepository, MockResult {
    var expectedResult: [User]
    init(expectedResult:[User]) {
        self.expectedResult = expectedResult
        super.init(remoteDataSource: MockUserService(expectedResult: expectedResult))
    }
}
