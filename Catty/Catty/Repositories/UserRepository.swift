//
//  UserRepository.swift
//  UserRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
protocol UserRepositoryProtocol {
    func fetchUser() async throws -> [User]
}

class UserRepository: UserRepositoryProtocol {
    private let remoteDataSource:UserServiceProtocol
    
    init(remoteDataSource:UserServiceProtocol = UserService()){
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchUser() async throws -> [User] {
        return try await self.remoteDataSource.fetchUser()
    }
}
