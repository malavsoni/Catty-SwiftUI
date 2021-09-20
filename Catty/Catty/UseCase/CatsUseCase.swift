//
//  File.swift
//  File
//
//  Created by Malav Soni on 04/09/21.
//

import Foundation

protocol CatsUseCaseProtocol {
    @discardableResult func fetchFacts() async throws -> [CatFactEntity]
    @discardableResult func fetchUser() async throws -> [UserEntity]
}

enum CatsUseCaseError: Error {
    case userAuthorizationFailed
    case sww
}

class CatsUseCase:CatsUseCaseProtocol {
    
    private let userRepository:UserRepositoryProtocol
    private let catFactsRepository:CatFactsRepositoryProtocol
      
    init(
        userRepository:UserRepositoryProtocol = UserRepository(),
        catFactsRepository:CatFactsRepositoryProtocol = CatFactsRepository()
    ) {
        self.catFactsRepository = catFactsRepository
        self.userRepository = userRepository
    }
    @discardableResult
    func fetchFacts() async throws -> [CatFactEntity] {
        if self.userRepository.isUserAuthenticated() {
            return try await self.catFactsRepository.fetchFacts()
        }
        throw CatsUseCaseError.userAuthorizationFailed
    }
    @discardableResult
    func fetchUser() async throws -> [UserEntity] {
        if self.userRepository.isUserAuthenticated() {
            return try await self.userRepository.fetchUser()
        }
        throw CatsUseCaseError.userAuthorizationFailed
    }
}
