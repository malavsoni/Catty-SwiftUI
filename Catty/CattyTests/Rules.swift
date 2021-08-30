//
//  Rules.swift
//  Rules
//
//  Created by Malav Soni on 30/08/21.
//

import Foundation

protocol MockResult {
    associatedtype ResultType
    var expectedResult:ResultType { get set }
}
