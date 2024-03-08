//
//  BundleService.swift
//  ios_core_swiftTests
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

final class BundleService {
  
  static func json(file: String) throws -> String? {
    let bundle = Bundle(for: self)
    guard let path = bundle.path(forResource: file, ofType: "json") else { return nil }
    return try String(contentsOfFile: path)
  }
  
}
