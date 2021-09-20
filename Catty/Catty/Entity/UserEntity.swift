//
//  UserEntity.swift
//  UserEntity
//
//  Created by Malav Soni on 19/09/21.
//

import Foundation
import CoreData
 

struct UserEntity:Codable, Identifiable, Hashable, Equatable, ConvertableToModel {
    let id:Int
    var name:String
    var coreDataId:NSManagedObjectID?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    var initials:String {
        self.name.components(separatedBy: " ")
            .reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
            .uppercased()
    }
    
    init(id:Int, name:String){
        self.id = id
        self.name = name
    }
    init(name:String) {
        self.init(id: Int.random(in: 0...1000), name: name)
    }
    
    init(model:User) {
        self.coreDataId = model.objectID
        self.id = Int(model.id)
        self.name = model.name
    }
    
    func toModel(context: NSManagedObjectContext) -> User {
        let user = User(context: context)
        user.id = Int64(self.id)
        user.name = self.name
        return user
    }
}
