//
//  UserLocalService.swift
//  UserLocalService
//
//  Created by Malav Soni on 15/09/21.
//

import Foundation

class UserLocalService:BaseLocalService, UserService {
    
    private let get:String = "525dc509-4a30-4636-ba40-ebc8232c5125"
    
    func fetchUser() async throws -> [UserEntity] {
        let users:[User] = try await self.fetchAll()
        return users.map { UserEntity(model: $0) }
    }
    
    func isUserAuthenticated() -> Bool {
        true
    }
}
