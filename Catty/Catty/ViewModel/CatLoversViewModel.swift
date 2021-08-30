//
//  CatLoversViewModel.swift
//  CatLoversViewModel
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

final class CatLoversViewModel:ObservableObject {
    
    private let userRepository:UserRepositoryProtocol
    private let catFactsRepository:CatFactsRepositoryProtocol
    
    @Published private(set) var users:[User] = []
    @Published private(set) var facts:[CatFact] = []
    
    init(
        userRepository:UserRepositoryProtocol = UserRepository(),
        catFactsRepository:CatFactsRepositoryProtocol = CatFactsRepository()
    ) {
        self.catFactsRepository = catFactsRepository
        self.userRepository = userRepository
    }
    
    @MainActor
    func fetchInfo() {
        Task {
            do {
                async let cloudUsers = try self.userRepository.fetchUser()
                async let cloudFacts = try self.catFactsRepository.fetchFacts()
                self.users = try await cloudUsers
                self.facts = try await cloudFacts
            } catch let error {
              print(error)
            }
        }
    }
}
