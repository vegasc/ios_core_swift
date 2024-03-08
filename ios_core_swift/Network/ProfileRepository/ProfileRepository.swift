//
//  ProfileRepository.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

protocol ProfileRepository {
  
  func getProfile<T: Codable>() async throws -> T?
  
}
