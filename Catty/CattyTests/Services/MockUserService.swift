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
    
    override func fetchUser(completion: @escaping (Result<[User], Error>) -> Void) {
        completion(.success(self.expectedResult))
    }
}
