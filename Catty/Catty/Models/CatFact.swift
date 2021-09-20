//
//  CatFact.swift
//  CatFact
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
import CoreData

@objc(CatFact)
class CatFact: NSManagedObject, Codable {
    let id:UUID = UUID()
    @NSManaged var fact: String
    @NSManaged var length: Int64

    enum CodingKeys: String, CodingKey {
        case fact = "fact"
        case length = "length"
    } 
    
    required convenience init(from decoder: Decoder) throws {
        guard
            let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: String.init(describing: CatFact.self), in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fact = try container.decodeIfPresent(String.self, forKey: .fact) ?? ""
        self.length = try container.decodeIfPresent(Int64.self, forKey: .length) ?? -1
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(self.fact , forKey: .fact)
            try container.encode(self.length , forKey: .length)
        }catch {
            
        }
    }
}
