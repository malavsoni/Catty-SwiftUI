//
//  User.swift
//  User
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    var initials:String {
        self.name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }.uppercased()
    }
    init(name:String) {
        self.id = Int.random(in: 0...10000)
        self.name = name
    }
}
