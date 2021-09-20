//
//  User.swift
//  User
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
import CoreData

@objc(User)
class User:NSManagedObject, Codable {
    @NSManaged var id: Int64
    @NSManaged var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    } 
    
    required convenience init(from decoder: Decoder) throws {
        guard
            let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: String.init(describing: User.self), in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int64.self, forKey: .id) ?? -1
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(id , forKey: .id)
            try container.encode(name , forKey: .name)
        }catch {
            
        }
    }
}
