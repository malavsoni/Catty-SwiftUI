//
//  CatLoversViewModel.swift
//  CatLoversViewModel
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

final class CatLoversViewModel:ObservableObject {
    private let catsUseCase:CatsUseCaseProtocol
    
    @Published private(set) var users:[User] = []
    @Published private(set) var facts:[CatFact] = []
    private(set) var exceptionInfo:Error?
    
    init(
        catsUseCase:CatsUseCaseProtocol = CatsUseCase()
    ) {
        self.catsUseCase = catsUseCase
    }
    
    @MainActor
    func getInformation() {
        Task {
            do {
                async let cloudUsers =  self.catsUseCase.fetchUser()
                async let cloudFacts  =  self.catsUseCase.fetchFacts()
                self.users = try await cloudUsers
                self.facts = try await cloudFacts
            } catch (let error) {
                self.exceptionInfo = error
                print(error)
            }
        }
    }
}
