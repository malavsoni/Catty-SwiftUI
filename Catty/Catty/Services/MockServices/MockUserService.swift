//
//  MockUserService.swift
//  MockUserService
//
//  Created by Malav Soni on 30/08/21.
//

import Foundation

class MockUserService:UserService,MockResult {
    var expectedResult:[User]
    init(expectedResult:[User]) {
        self.expectedResult = expectedResult
        super.init()
    }
    
    override func fetchUser() async throws -> [User] {
        expectedResult
    }
}
