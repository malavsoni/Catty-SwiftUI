//
//  UserService.swift
//  UserService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUser() async throws -> [User]
}

class UserService:BaseAPIService, UserServiceProtocol {
    private let get:String = "525dc509-4a30-4636-ba40-ebc8232c5125"
    
    func fetchUser() async throws -> [User] {
        return try await self.get(url: endpoint(get), expectedModel: [User].self)
    }
}
