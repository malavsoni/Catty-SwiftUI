//
//  CatFactsService.swift
//  CatFactsService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
 
protocol CatFactsServiceProtocol {
    func fetchFacts(completion:@escaping (Result<[CatFact], Error>) -> Void) -> Void
}

class CatFactsService:BaseAPIService, CatFactsServiceProtocol {
    private let get:String = "9e563b1d-2a9e-4116-a2f4-33f4f9da64d9"
    
    func fetchFacts(completion:@escaping (Result<[CatFact], Error>) -> Void) -> Void {
        self.get(url: endpoint(get), expectedModel: [CatFact].self, completion: completion)
    }
}
