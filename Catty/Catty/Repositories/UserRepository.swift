    //
    //  UserRepository.swift
    //  UserRepository
    //
    //  Created by Malav Soni on 29/08/21.
    //

import Foundation

typealias UserLocalDataSource = UserService & SaveableService

protocol UserRepositoryProtocol {
    func isUserAuthenticated() -> Bool
    func fetchUser() async throws -> [UserEntity]
}

class UserRepository: UserRepositoryProtocol {
    private let remoteDataSource:UserService
    private let localDataSource:UserLocalDataSource
    
    init(remoteDataSource:UserService = UserRemoteService(),
         localDataSource:UserLocalDataSource = UserLocalService()
    ){
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchUser() async throws -> [UserEntity] {
        do {
            let users = try await self.localDataSource.fetchUser()
            if users.isEmpty {
                let users:[UserEntity] =  try await self.remoteDataSource.fetchUser()
                try await self.localDataSource.saveAll(entities: users)
                return users
            }
            return users
        } catch {
            return try await self.remoteDataSource.fetchUser()
        }
    }
    
    func isUserAuthenticated() -> Bool {
        self.remoteDataSource.isUserAuthenticated()
    }
}
