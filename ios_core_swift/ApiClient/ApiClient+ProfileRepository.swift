//
//  ApiClient+ProfileRepository.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

extension ApiClient {
  
  func getProfile<T: Codable>() async throws -> T? {
    return try await profileRepository.getProfile()
  }
  
}
