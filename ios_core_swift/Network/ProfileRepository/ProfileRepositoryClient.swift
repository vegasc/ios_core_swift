//
//  ProfileRepositoryClient.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

final class ProfileRepositoryClient: ProfileRepository {
  
  private let decoder = JSONDecoder()
  
  init() {
    decoder.dateDecodingStrategy = .iso8601
  }
  
  func getProfile<T: Codable>() async throws -> T? {
    
    let json = """
    {
      "name": "Aleksey",
      "surname": "Robul",
      "bio": "iOS Developer"
    }
    """
    
    let jsonData = json.data(using: .utf8)!
    
    return try await withUnsafeThrowingContinuation { continuation in
      do {
        let model = try self.decoder.decode(T.self, from: jsonData)
        continuation.resume(returning: model)
      } catch (let error) {
        continuation.resume(throwing: error)
      }
    }
  }
  
}
