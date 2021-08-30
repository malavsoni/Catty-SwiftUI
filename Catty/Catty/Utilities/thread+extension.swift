//
//  thread+extension.swift
//  thread+extension
//
//  Created by Malav Soni on 30/08/21.
//

import Foundation

extension Thread {
  var isRunningXCTest: Bool {
    for key in self.threadDictionary.allKeys {
      guard let keyAsString = key as? String else {
        continue
      }

      if keyAsString.split(separator: ".").contains("xctest") {
        return true
      }
    }
    return false
  }
}
