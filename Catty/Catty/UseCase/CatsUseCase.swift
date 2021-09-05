//
//  File.swift
//  File
//
//  Created by Malav Soni on 04/09/21.
//

import Foundation

protocol CatsUseCaseProtocol {
    func fetchFacts() async throws -> [CatFact]
    func fetchUser() async throws -> [User]
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
    
    func fetchFacts() async throws -> [CatFact] {
        if self.userRepository.isUserAuthenticated() {
            return try await self.catFactsRepository.fetchFacts()
        }
        throw CatsUseCaseError.userAuthorizationFailed
    }
    
    func fetchUser() async throws -> [User] {
        if self.userRepository.isUserAuthenticated() {
            return try await self.userRepository.fetchUser()
        }
        throw CatsUseCaseError.userAuthorizationFailed
    }
}
