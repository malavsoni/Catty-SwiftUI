//
//  Services.swift
//  Services
//
//  Created by Malav Soni on 15/09/21.
//

import Foundation

protocol SaveableService {
    func save<T:ConvertableToModel>(entity:T) async throws 
    func saveAll<T:ConvertableToModel>(entities:[T]) async throws
}

protocol UserService {
    func isUserAuthenticated() -> Bool
    func fetchUser() async throws -> [UserEntity]
}

protocol CatFactsService {
    func fetchFacts() async throws -> [CatFactEntity]
}
