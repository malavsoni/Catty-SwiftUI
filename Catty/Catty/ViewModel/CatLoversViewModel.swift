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
    
    func getUsers() {
        self.userRepository.fetchUser { result in
            switch result {
                case .success(let users):
                    if Thread.current.isRunningXCTest {
                        self.users = users
                    } else {
                        OperationQueue.main.addOperation {
                            self.users = users
                        }
                    }
                    break
                case .failure( _):
                    break
            }
        }
    }
    
    func getFacts() {
        self.catFactsRepository.fetchFacts { result in
            switch result {
                case .success(let facts):
                    if Thread.current.isRunningXCTest {
                        self.facts = facts
                    } else {
                        OperationQueue.main.addOperation {
                            self.facts = facts
                        }
                    }
                    break
                case .failure( _):
                    break
            }
        }
    }
}
