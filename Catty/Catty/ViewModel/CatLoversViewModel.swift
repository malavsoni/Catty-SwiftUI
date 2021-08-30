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
                self.users = try await self.userRepository.fetchUser()
                self.facts = try await self.catFactsRepository.fetchFacts()
            } catch let error {
              print(error)
            }
        }
    }
}
