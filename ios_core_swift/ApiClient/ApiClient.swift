//
//  ApiClient.swift
//  ios_core_swift
//
//  Created by Aleksey on 07.03.2024.
//

import Foundation

struct ApiClient {
  
  // MARK: - Fields
  
  let profileRepository: ProfileRepository
  
  // MARK: - Lifecycle
  
  init(profileRepository: ProfileRepository) {
    self.profileRepository = profileRepository
  }
  
}
