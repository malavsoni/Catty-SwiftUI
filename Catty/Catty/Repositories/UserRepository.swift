//
//  UserRepository.swift
//  UserRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
protocol UserRepositoryProtocol {
    func isUserAuthenticated() -> Bool
    func fetchUser() async throws -> [User]
}

class UserRepository: UserRepositoryProtocol {
    private let service:UserServiceProtocol
    
    init(remoteDataSource:UserServiceProtocol = UserService()){
        self.service = remoteDataSource
    }
    
    func fetchUser() async throws -> [User] {
        print("Fetching the user \(Date())")
        return try await self.service.fetchUser()
    }
    
    func isUserAuthenticated() -> Bool {
        self.service.isUserAuthenticated()
    }
}
