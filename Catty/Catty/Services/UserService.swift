//
//  UserService.swift
//  UserService
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUser(completion:@escaping (Result<[User], Error>) -> Void) -> Void
}

class UserService:BaseAPIService, UserServiceProtocol {
    private let get:String = "525dc509-4a30-4636-ba40-ebc8232c5125"
    
    func fetchUser(completion: @escaping (Result<[User], Error>) -> Void) {
        self.get(url: endpoint(get), expectedModel: [User].self, completion: completion)
    }
}
