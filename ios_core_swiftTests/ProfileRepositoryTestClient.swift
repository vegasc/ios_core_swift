//
//  ProfileRepositoryTestClient.swift
//  ios_core_swiftTests
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation
import Combine

final class ProfileRepositoryTestClient: ProfileRepository {
  
  // MARK: - Fields
  
  private let decoder = JSONDecoder()
  
  // MARK: - Lifecycle
  
  init() {
    decoder.dateDecodingStrategy = .iso8601
  }
  
  // MARK: - Functions
  
  func getProfile<T: Codable>() async throws -> T? {
    do {
      let file = isPositiveTest ? "user_profile_correct" : "user_profile_incorrect"
      guard let json = try BundleService.json(file: file) else {
        throw NSError(domain: "", code: 0, userInfo: [
          NSLocalizedDescriptionKey: "Could not find json named `user_profile_correct`"
        ])
      }
      guard let data = json.data(using: .utf8) else {
        throw NSError(domain: "", code: 0, userInfo: [
          NSLocalizedDescriptionKey: "Could not get data"
        ])
      }
      return try self.decoder.decode(T.self, from: data)
    } catch (let error) {
      throw error
    }
  }
  
}
