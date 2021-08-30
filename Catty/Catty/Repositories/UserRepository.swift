//
//  UserRepository.swift
//  UserRepository
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
protocol UserRepositoryProtocol {
    func fetchUser(completion:@escaping (Result<[User], Error>) -> Void) -> Void
}

class UserRepository: UserRepositoryProtocol {
    private let remoteDataSource:UserServiceProtocol
    
    init(remoteDataSource:UserServiceProtocol = UserService()){
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchUser(completion: @escaping (Result<[User], Error>) -> Void) {
        self.remoteDataSource.fetchUser(completion: completion)
    }
}
