//
//  UserService.swift
//  UserService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

class UserRemoteService:BaseAPIService, UserService {
    private let get:String = "525dc509-4a30-4636-ba40-ebc8232c5125"
    
    func fetchUser() async throws -> [UserEntity] {
        try await self.get(url: endpoint(get))
    }
    
    func isUserAuthenticated() -> Bool {
        true
    }
}
