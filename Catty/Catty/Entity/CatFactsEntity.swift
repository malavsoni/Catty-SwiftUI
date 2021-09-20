//
//  CatFactsEntity.swift
//  CatFactsEntity
//
//  Created by Malav Soni on 19/09/21.
//

import Foundation
import CoreData

struct CatFactEntity: Codable, Identifiable, Hashable, Equatable {
    
    let id:UUID = UUID()
    let fact: String
    let length: Int
    var coreDataId:NSManagedObjectID?

    enum CodingKeys: String, CodingKey {
        case fact = "fact"
        case length = "length"
    }
    
    init(fact:String) {
        self.length = Int.random(in: 0...1000)
        self.fact = fact
    }
    
    init(model:CatFact) {
        self.coreDataId = model.objectID
        self.length = Int(model.length)
        self.fact = model.fact
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

extension CatFactEntity :ConvertableToModel {
    func toModel(context: NSManagedObjectContext) -> CatFact {
        let catFact = CatFact(context: context)
        catFact.fact = self.fact
        catFact.length = Int64(self.length)
        return catFact
    }
}
