//
//  FakeUserService.swift
//  FakeUserService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
@testable import Catty

class MockUserService:UserService,MockResult {
    var expectedResult:[User]
    init(expectedResult:[User]) {
        self.expectedResult = expectedResult
        super.init()
    }
    
    override func fetchUser() async throws -> [User] {
        return self.expectedResult
    }
}
