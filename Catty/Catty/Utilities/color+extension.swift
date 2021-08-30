//
//  color+extension.swift
//  color+extension
//
//  Created by Malav Soni on 29/08/21.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
