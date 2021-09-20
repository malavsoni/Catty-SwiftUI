//
//  MockUserService.swift
//  MockUserService
//
//  Created by Malav Soni on 30/08/21.
//

import Foundation

class MockUserService:UserRemoteService,MockResult {
    var expectedResult:[UserEntity]
    init(expectedResult:[UserEntity]) {
        self.expectedResult = expectedResult
        super.init()
    }
    
    override func fetchUser() async throws -> [UserEntity] {
        expectedResult
    }
}
