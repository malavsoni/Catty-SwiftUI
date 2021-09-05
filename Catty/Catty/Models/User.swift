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
    
    init(name:String) {
        self.id = Int.random(in: 0...1000)
        self.name = name
    }
    
    var initials:String {
        self.name.components(separatedBy: " ")
            .reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
            .uppercased()
    }
}
