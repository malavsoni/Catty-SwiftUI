//
//  CatFact.swift
//  CatFact
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
struct CatFact: Codable, Identifiable, Hashable, Equatable {
    let id:UUID = UUID()
    let fact: String
    let length: Int

    enum CodingKeys: String, CodingKey {
        case fact = "fact"
        case length = "length"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    init(fact:String) {
        self.length = Int.random(in: 0...1000)
        self.fact = fact
    }
}
